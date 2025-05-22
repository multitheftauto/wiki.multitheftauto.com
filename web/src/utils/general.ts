import { marked } from 'marked';
import path from 'path';
import { getFunctionsByTypeByCategory } from '@src/utils/functions';
import { getEventsByTypeByCategory } from '@src/utils/events';

export function renderInlineMarkdown(markdown: string): string | Promise<string> {
  const html = marked.parseInline(markdown);
  return html;
}

type SeeAlsoLink = {
  name: string;
  link: string;
};

export type SeeAlsoLinkGroup = {
  title: string;
  links: SeeAlsoLink[];
};

// Gets related functions and other items (links) according to the see_also field
// Currently implemented for functions, events and elements
export function getPageSeeAlsoLinks(theItem: any): SeeAlsoLinkGroup[] {
  const { itemType, shared, client, server, see_also, niceName } = theItem.data;
  const filePath = theItem.filePath || '';
  const itemCategoryName = path.basename(path.dirname(filePath));

  let seeAlso: string[] = [];
  let addToSeeAlso: string[] = [];

  switch (itemType) {
    case 'function':
      seeAlso = shared?.see_also ?? client?.see_also ?? server?.see_also ?? [];
      addToSeeAlso = [
        `functions:any:${itemCategoryName}`,
        `events:any:${itemCategoryName}`,
      ];
      break;

    case 'event':
      seeAlso = see_also ?? [];
      addToSeeAlso = [
        `events:any:${itemCategoryName}`,
        `functions:any:${itemCategoryName}`,
      ];
      break;

    case 'element':
      seeAlso = see_also ?? [];
      addToSeeAlso = [
        `functions:any:${niceName}`,
        `events:any:${niceName}`,
        `functions:any:Element`,
        `events:any:Element`,
      ];
      break;

    default:
      throw new Error('Invalid item type passed');
  }

  // Preserve original order
  const allSeeAlso = [...new Set([...seeAlso, ...addToSeeAlso])];

  const getItemsInCategory = (type: string, subType: string, category: string): any[] => {
    switch (type) {
      case 'functions': {
        const fnByType = getFunctionsByTypeByCategory();
        return subType === 'any'
          ? [
              ...(fnByType.shared?.[category] || []),
              ...(fnByType.client?.[category] || []),
              ...(fnByType.server?.[category] || []),
            ]
          : fnByType?.[subType as keyof typeof fnByType]?.[category] || [];
      }

      case 'events': {
        const evByType = getEventsByTypeByCategory();
        return subType === 'any'
          ? [
              ...(evByType.client?.[category] || []),
              ...(evByType.server?.[category] || []),
            ]
          : evByType?.[subType as keyof typeof evByType]?.[category] || [];
      }

      default:
        return [];
    }
  };

  const titleCase = (str: string) =>
    str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();

  const makeTitle = (subType: string, category: string, type: string): string => {
    const categoryPart = titleCase(category);
    const typePart = titleCase(type);
    if (subType === 'any') {
      return `${categoryPart} ${typePart}`;
    } else {
      return `${titleCase(subType)} ${categoryPart} ${typePart}`;
    }
  };

  const groups: SeeAlsoLinkGroup[] = [];

  for (const item of allSeeAlso) {
    const [type, subType, category] = item.split(':');
    if (!type || !subType || !category) continue;

    const items = getItemsInCategory(type, subType, category);
    if (!items.length) continue;

    const links: SeeAlsoLink[] = items.map((i: any) => ({
      name: i.id,
      link: `/${i.id}`,
    }));

    groups.push({
      title: makeTitle(subType, category, type),
      links: links.sort((a, b) => a.name.localeCompare(b.name)),
    });
  }

  return groups;
}
