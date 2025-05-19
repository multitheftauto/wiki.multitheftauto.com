import { getCollection } from 'astro:content';
import path from 'path';

import type { FunctionType } from './types';

type FunctionItem = Awaited<ReturnType<typeof getCollection>>[number];

// Define a structure for function parameters
type FunctionParameter = {
    name: string;
    type: string; // Adjust type as needed (e.g., string | string[])
    description?: string;
    optional?: boolean;
};

// Define a structure for the details expected within shared/client/server
type FunctionDetails = {
    description?: string;
    pair?: boolean;
    examples?: { code: string; description?: string }[];
    notes?: string[];
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

// Use the specific FunctionDetails type
export type TypedFunctionData = {
    shared?: FunctionDetails;
    client?: FunctionDetails;
    server?: FunctionDetails;
};

export const functionTypePrettyName = {
    'client': 'Client-side',
    'server': 'Server-side',
    'shared': 'Shared',
} as const; // Use 'as const' for stricter typing of keys

function getFunctionType(data: FunctionData): FunctionType {
    if (data.shared) return 'shared';
    if (data.client) return 'client';
    return 'server';
}
function getFunctionTypePretty(data: FunctionData): string {
    // No need for fallback, getFunctionType guarantees a valid FunctionType
    const funcType = getFunctionType(data);
    return functionTypePrettyName[funcType];
}

// Define a return type for getFunctionInfo
export type FunctionInfo = {
    description: string;
    type: FunctionType;
    typePretty: string;
    pair: boolean;
    examples: { code: string; description?: string }[];
    notes?: string[]; // Added notes
    parameters?: FunctionParameter[]; // Added parameters
};

export function getFunctionInfo(data: TypedFunctionData): FunctionInfo {
    const type = getFunctionType(data);
    const details = data[type] ?? {}; // Get details based on type, default to empty object

    return {
        description: details.description || '',
        type: type,
        typePretty: getFunctionTypePretty(data),
        pair: details.pair || false,
        examples: details.examples || [],
        notes: details.notes, // Extract notes (will be undefined if not present)
        parameters: details.parameters || [], // Extract parameters
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
    // Assuming func.filePath exists, handle potential undefined if necessary
    const normalizedPath = path.normalize(func.id); // Use func.id which includes the path relative to content dir
    const folder = path.basename(path.dirname(normalizedPath));
    if (!functionsByCategory[folder]) {
        functionsByCategory[folder] = [];
    }
    functionsByCategory[folder].push(func);

    const funcType = getFunctionType(func.data);
    // Ensure the folder exists for the specific type
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