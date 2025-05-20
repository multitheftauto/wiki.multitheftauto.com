export type FunctionType = 'shared' | 'client' | 'server';
export type NotesType = {
    type: 'standard' | 'important';
    content: string;
}[];