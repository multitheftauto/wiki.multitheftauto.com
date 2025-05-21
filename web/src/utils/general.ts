import { marked } from 'marked';

export function renderInlineMarkdown(markdown: string): string | Promise<string> {
  const html = marked.parseInline(markdown);
  return html;
}
