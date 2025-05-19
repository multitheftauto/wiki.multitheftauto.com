import { getCollection } from 'astro:content';
import path from 'path';

import type { FunctionType } from './types';

type FunctionItem = Awaited<ReturnType<typeof getCollection>>[number];

type FunctionParameter = {
    name: string;
    type: string;
    description?: string;
};

type FunctionDetails = {
    description?: string;
    pair?: boolean;
    examples?: { code: string; description?: string }[];
    notes?: string[];
    important_notes?: string[];
    parameters?: FunctionParameter[];
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

export type TypedFunctionData = {
    shared?: FunctionDetails;
    client?: FunctionDetails;
    server?: FunctionDetails;
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

export type FunctionInfo = {
    description: string;
    type: FunctionType;
    typePretty: string;
    pair: boolean;
    examples: { code: string; description?: string }[];
    notes?: string[];
    important_notes?: string[];
    parameters?: FunctionParameter[];
};

export function getFunctionInfo(data: TypedFunctionData): FunctionInfo {
    const type = getFunctionType(data);
    const details = data[type] ?? {};

    return {
        description: details.description || '',
        type: type,
        typePretty: getFunctionTypePretty(data),
        pair: details.pair || false,
        examples: details.examples || [],
        notes: details.notes || [],
        important_notes: details.important_notes || [],
        parameters: details.parameters || [],
    };
}

const functionsCollection = await getCollection('functions');
let functionsByCategory: FunctionsByCategory = {};
let functionsByTypeByCategory: FunctionsByTypeByCategory = {
    shared: {},
    client: {},
    server: {}
};

for (let func of functionsCollection) {
    const normalizedPath = path.normalize(func.id);
    const folder = path.basename(path.dirname(normalizedPath));
    if (!functionsByCategory[folder]) {
        functionsByCategory[folder] = [];
    }
    functionsByCategory[folder].push(func);

    const funcType = getFunctionType(func.data);
    if (!functionsByTypeByCategory[funcType]?.[folder]) {
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