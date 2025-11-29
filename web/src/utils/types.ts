import type { getCollection } from "astro:content";

export type FunctionType = 'shared' | 'client' | 'server';
export type NotesTypeType = 'info' | 'warning' | 'important' | 'tip' | 'needs_checking';
export type NotesType = {
    type: NotesTypeType
    content: string;
}[];

export type FunctionItem = Awaited<ReturnType<typeof getCollection>>[number];

export type BaseOOP = {
  element: string;
  note?: string;
};

// /!\ constructor is a reserved word in JS/TS, so we use constructorclass
export type MethodOOP = BaseOOP & {
  method: string;
  static: boolean;
  variable?: string;
  constructorclass?: never; // mutually exclusive with constructor
};

export type ConstructorOOP = BaseOOP & {
  constructorclass: string;
  method?: never;      // mutually exclusive with method
  static?: never;
  variable?: never;
};

export type OOPInfo = MethodOOP | ConstructorOOP;

export type FunctionInfo = {
    description: string;
    requiresReview?: boolean;
    type: FunctionType;
    typePretty: string;
    pair?: string;
    preview_images?: string[];
    oop?: OOPInfo;
    notes?: NotesType;
    version?: VersionInfo;
    issues?: IssuesTable;
    redirect?: string;
};

export type FunctionData = {
    shared?: any;
    client?: any;
    server?: any;
};

export type VersionInfo = {
  added?: string;
  updated?: string;
  removed?: string;
};

export type IssuesTable = {
    id: number|string
    description: string
}[];

export type FunctionsByCategory = {
    [folder: string]: FunctionItem[];
};
export type FunctionsByTypeByCategory = {
    [key in FunctionType]: FunctionsByCategory;
};

export type Parameter = {
  name: string;
  type: string;
  description: string;
  default?: string;
  templateList?: string;
};

export type ReturnValue = {
  type: string;
  name: string;
  templateList?: string;
};

export type ReturnBlock = {
  description?: string;
  values: ReturnValue[];
};

export type Syntax = {
  type: string;
  parameters: Parameter[];
  returns: ReturnBlock | null;
  syntaxString: string;
  displayParams?: boolean;
};

export type MetaItem = {
  needs_checking?: string;
  changelog?: { version: string; description: string }[];
};