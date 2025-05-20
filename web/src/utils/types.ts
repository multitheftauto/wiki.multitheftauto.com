export type FunctionType = 'shared' | 'client' | 'server';
export type NotesType = {
    type: 'info' | 'warning' | 'important';
    content: string;
}[];