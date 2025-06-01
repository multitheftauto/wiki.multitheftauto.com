export type FunctionType = 'shared' | 'client' | 'server';
export type NotesTypeType = 'info' | 'warning' | 'important' | 'tip' | 'needs_checking';
export type NotesType = {
    type: NotesTypeType
    content: string;
}[];