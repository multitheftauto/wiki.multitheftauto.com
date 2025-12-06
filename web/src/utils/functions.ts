import { getCollection } from 'astro:content';
import path from 'path';

import type { FunctionData, FunctionInfo, FunctionsByCategory, FunctionsByTypeByCategory, FunctionType, Parameter, ReturnBlock, Syntax } from './types';

const ordinalWords = ['First', 'Second', 'Third'];

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

// return_type func_name ( param1, param2, [ optional param1 ] )
// e.g. bool setCursorPosition ( int cursorX, int cursorY )
function buildSyntaxString(
  funcName: string,
  parameters: Parameter[],
  returns: ReturnBlock | null,
): string {
  const ZERO_WIDTH_SPACE = '\u200B';

  const returnString = returns
    ? `${returns.values.map(v => v.type).join(`,${ZERO_WIDTH_SPACE} `)}`
    : '';

  const paramParts: string[] = [];
  let optionalGroup: string[] = [];

  const flushOptional = () => {
    if (optionalGroup.length) {
      paramParts.push(`[ ${optionalGroup.join(', ')} ]`);
      optionalGroup = [];
    }
  };

  for (const p of parameters) {
    const str = `${p.type} ${p.name}${p.default !== undefined ? ` = ${p.default}` : ''}`;

    if (p.default !== undefined) {
      optionalGroup.push(str);
    } else {
      flushOptional();
      paramParts.push(str);
    }
  }

  flushOptional();

  const paramStr = paramParts.join(', ');
  const spacedParams = paramStr.trim() === '' ? ' ' : ` ${paramStr} `;

  return `${returnString} ${funcName} (${spacedParams})`;
}

export function parseFunctionSyntaxes(funcName: string, funcData: FunctionData): Syntax[] {
  const syntaxes: Syntax[] = [];

  const { shared, server, client } = funcData;

  const stripIgnored = (params: Parameter[] = [], ignore: string[] = []) =>
    params.filter(p => !ignore.includes(p.name));

  const funcType = getFunctionType(funcData);

  const pushSyntax = (
    type: string,
    params: Parameter[],
    returns: ReturnBlock | null,
    displayParams: boolean = true,
    customFuncName?: string,
  ) => {
    syntaxes.push({
      type,
      parameters: params,
      returns,
      syntaxString: buildSyntaxString(customFuncName || funcName, params, returns),
      displayParams,
    });
  };

  const getOrdinalWord = (index: number) => {
    return ordinalWords[index - 1] || `${index}th`;
  };

  const pushExtraSyntaxes = (base: any, mainType: string) => {
    if (!base?.syntaxes) return;

    let index = 2;
    for (const s of base.syntaxes) {
      const params = s.parameters || [];
      const returns = s.returns || null;

      const ordinal = getOrdinalWord(index);
      let syntaxType: string;

      if (mainType === 'shared') {
        syntaxType = `${ordinal}`;
      } else if (mainType === 'client') {
        syntaxType = `${ordinal} Client`;
      } else if (mainType === 'server') {
        syntaxType = `${ordinal} Server`;
      } else {
        syntaxType = `${ordinal} Syntax`;
      }

      pushSyntax(syntaxType, params, returns, s.displayParams ?? true, s.name || funcName);

      index++;
    }
  };

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
      pushSyntax('shared', sharedParams, sharedReturns);
      pushExtraSyntaxes(shared, 'shared');
    } else {
      pushSyntax('client', clientParams, clientReturns);
      pushExtraSyntaxes(client, 'client');
      pushSyntax('server', serverParams, serverReturns);
      pushExtraSyntaxes(server, 'server');
    }
  } else if (funcType === 'client') {
    pushSyntax('client', client?.parameters || [], client?.returns || null);
    pushExtraSyntaxes(client, 'client');
  } else if (funcType === 'server') {
    pushSyntax('server', server?.parameters || [], server?.returns || null);
    pushExtraSyntaxes(server, 'server');
  }

  return syntaxes;
}

export function getFunctionInfo(data: FunctionData): FunctionInfo {
    const type = getFunctionType(data);
    const details: FunctionInfo = data[type];
    details.type = type;
    details.typePretty = getFunctionTypePretty(data);
    details.requiresReview = data[type].requires_review === true;
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
    } else if (elementName === "colshape") {
      return 'ColShape';
    }
    return elementName.charAt(0).toUpperCase() + elementName.slice(1);
}