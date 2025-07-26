import { getCollection } from 'astro:content';
import path from 'path';

import type { FunctionType, NotesType } from './types';

type FunctionItem = Awaited<ReturnType<typeof getCollection>>[number];

type BaseOOP = {
  element: string;
  note?: string;
};

// /!\ constructor is a reserved word in JS/TS, so we use constructorclass
type MethodOOP = BaseOOP & {
  method: string;
  static: boolean;
  variable?: string;
  constructorclass?: never; // mutually exclusive with constructor
};

type ConstructorOOP = BaseOOP & {
  constructorclass: string;
  method?: never;      // mutually exclusive with method
  static?: never;
  variable?: never;
};

export type OOPInfo = MethodOOP | ConstructorOOP;

export type FunctionInfo = {
    description: string;
    incomplete?: boolean;
    type: FunctionType;
    typePretty: string;
    pair?: string;
    preview_images?: string[];
    oop?: OOPInfo;
    notes?: NotesType;
    version?: VersionInfo
};

type VersionInfo = {
  added?: string;
  updated?: string;
  removed?: string;
};

type FunctionsByCategory = {
    [folder: string]: FunctionItem[];
};
type FunctionsByTypeByCategory = {
    [key in FunctionType]: FunctionsByCategory;
};


export type FunctionData = {
    shared?: any;
    client?: any;
    server?: any;
};

export const functionTypePrettyName = {
    'client': 'Client-side',
    'server': 'Server-side',
    'shared': 'Shared',
} as const;

function getFunctionType(data: FunctionData): FunctionType {
    if (data.shared) return 'shared';
    if (data.client) return 'client';
    return 'server';
}
function getFunctionTypePretty(data: FunctionData): string {
    const funcType = getFunctionType(data);
    return functionTypePrettyName[funcType];
}


type Parameter = {
  name: string;
  type: string;
  description: string;
  default?: string;
};

type ReturnValue = {
  type: string;
  name: string;
};

type ReturnBlock = {
  description?: string;
  values: ReturnValue[];
};

type Syntax = {
  type: 'shared' | 'server' | 'client';
  parameters: Parameter[];
  returns: ReturnBlock | null;
  syntaxString: string;
};


// return_type func_name ( param1, param2, [ optional param1 ] )
// e.g. bool setCursorPosition ( int cursorX, int cursorY )
function buildSyntaxString(
  funcName: string,
  parameters: Parameter[],
  returns: ReturnBlock | null,
): string {
  const returnString = returns
    ? `${returns.values.map(v => v.type).join(', ')}`
    : '';

  const requiredParams = parameters.filter(p => p.default === undefined);
  const optionalParams = parameters.filter(p => p.default !== undefined);

  const requiredStr = requiredParams
    .map(p => `${p.type} ${p.name}`)
    .join(', ');

  const optionalStr = optionalParams
    .map(p => `${p.type} ${p.name} = ${p.default}`)
    .join(', ');

  let paramStr = '';
  if (requiredParams.length && optionalParams.length) {
    paramStr = `${requiredStr}, [ ${optionalStr} ]`;
  } else if (!requiredParams.length && optionalParams.length) {
    paramStr = `[ ${optionalStr} ]`;
  } else {
    paramStr = requiredStr;
  }

  const spacedParams = paramStr.trim() === '' ? ' ' : ` ${paramStr} `;

  return `${returnString} ${funcName} (${spacedParams})`;
}

export function parseFunctionSyntaxes(funcName: string, funcData: FunctionData): Syntax[] {
  const syntaxes: Syntax[] = [];

  const { shared, server, client } = funcData;

  const stripIgnored = (params: Parameter[] = [], ignore: string[] = []) =>
    params.filter(p => !ignore.includes(p.name));

  const funcType = getFunctionType(funcData);

  if (funcType === 'shared') {
    const sharedParams = shared?.parameters || [];
    const sharedReturns = shared?.returns || null;

    const clientParams =
    client?.parameters !== undefined
        ? stripIgnored(client.parameters, client.ignore_parameters || [])
        : stripIgnored(sharedParams, client?.ignore_parameters || []);

    const serverParams =
    server?.parameters !== undefined
        ? stripIgnored(server.parameters, server.ignore_parameters || [])
        : stripIgnored(sharedParams, server?.ignore_parameters || []);

    const clientReturns = client?.returns || sharedReturns;
    const serverReturns = server?.returns || sharedReturns;

    if (
      JSON.stringify(clientParams) === JSON.stringify(serverParams) &&
      JSON.stringify(clientReturns) === JSON.stringify(serverReturns)
    ) {
      syntaxes.push({
        type: 'shared',
        parameters: sharedParams,
        returns: sharedReturns,
        syntaxString: buildSyntaxString(funcName, sharedParams, sharedReturns),
      });
    } else {
      syntaxes.push({
        type: 'client',
        parameters: clientParams,
        returns: clientReturns,
        syntaxString: buildSyntaxString(funcName, clientParams, clientReturns),
      });
      syntaxes.push({
        type: 'server',
        parameters: serverParams,
        returns: serverReturns,
        syntaxString: buildSyntaxString(funcName, serverParams, serverReturns),
      });
    }
  } else if (funcType === 'client') {
    syntaxes.push({
      type: 'client',
      parameters: client?.parameters || [],
      returns: client?.returns || null,
      syntaxString: buildSyntaxString(funcName, client?.parameters || [], client?.returns || null),
    });
  } else if (funcType === 'server') {
    syntaxes.push({
      type: 'server',
      parameters: server?.parameters || [],
      returns: server?.returns || null,
      syntaxString: buildSyntaxString(funcName, server?.parameters || [], server?.returns || null),
    });
  }

  return syntaxes;
}

export function getFunctionInfo(data: FunctionData): FunctionInfo {
    const type = getFunctionType(data);
    const details: FunctionInfo = data[type];
    details.type = type;
    details.typePretty = getFunctionTypePretty(data);
    return details;
}

const functionsCollection = await getCollection('functions');
let functionsByCategory: FunctionsByCategory = {};
let functionsByTypeByCategory: FunctionsByTypeByCategory = {
    shared: {},
    client: {},
    server: {}
};

for (let func of functionsCollection) {
    let folder = path.basename(path.dirname(func.filePath || ''));
    folder = folder.replace(/_/g, ' ');

    if (!functionsByCategory[folder]) {
        functionsByCategory[folder] = [];
    }
    functionsByCategory[folder].push(func);

    const funcType = getFunctionType(func.data);
    if (!functionsByTypeByCategory[funcType][folder]) {
        functionsByTypeByCategory[funcType][folder] = [];
    }
    functionsByTypeByCategory[funcType][folder].push(func);
}

export function getFunctionsByCategory(): FunctionsByCategory {
    return functionsByCategory;
}

export function getFunctionsByTypeByCategory(): FunctionsByTypeByCategory {
    return functionsByTypeByCategory;
}

export function getFixedStaticOOPClass(elementName: string): string {
    if (elementName === 'xmlnode') {
      return 'XML';
    } else if (elementName === "aclgroup") {
      return 'ACLGroup';
    } else if (elementName === "acl") {
      return 'ACL';
    } else if (elementName === "ban") {
      return 'Ban';
    }
    return elementName.charAt(0).toUpperCase() + elementName.slice(1);
}