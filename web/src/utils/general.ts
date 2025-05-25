import { marked } from 'marked';
import path from 'path';
import { getFunctionsByTypeByCategory } from '@src/utils/functions';
import { getEventsByTypeByCategory } from '@src/utils/events';
import { getElementsByCategory, getElementCategory } from '@src/utils/elements';

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

const titleCase = (str: string) =>
  str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();

const makeTitle = (subType: string, category: string, type: string): string => {
  const isUpperCase = category === category.toUpperCase();
  const categoryPart = isUpperCase ? category : titleCase(category);
  const typePart = titleCase(type);
  if (subType === 'any') {
    return `${categoryPart} ${typePart}`;
  } else {
    const isUpperCase2 = subType === subType.toUpperCase();
    const subTypePart = isUpperCase2 ? subType : titleCase(subType);
    return `${subTypePart} ${categoryPart} ${typePart}`;
  }
};

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
    case 'elements': {
      const elementsByCategory = getElementsByCategory();
      return elementsByCategory?.[category] || [];
    }
    default:
      return [];
  }
};

export function getSeeAlsoLinksFromList(seeAlsoList: string[]): SeeAlsoLinkGroup[] {
  const groupedMap = new Map<string, SeeAlsoLink[]>();

  for (const item of seeAlsoList) {
    const [type, ...rest] = item.split(':');
    if (!type || rest.length === 0) continue;

    // Handle 'article' links
    if (type === 'article') {
      const articleName = rest[0];
      const title = 'Articles';
      if (!groupedMap.has(title)) groupedMap.set(title, []);
      groupedMap.get(title)!.push({ name: articleName, link: `/${articleName}` });
      continue;
    }

    // Handle function/event style links
    const [subType, category] = rest;
    const items = getItemsInCategory(type, subType, category);
    if (!items.length) continue;

    const title = makeTitle(subType, category, type);
    if (!groupedMap.has(title)) groupedMap.set(title, []);
    const links = items.map((i: any) => ({ name: i.id, link: `/${i.id}` }));
    groupedMap.get(title)!.push(...links);
  }

  // Preserve input order for group titles
  const seenTitles = new Set<string>();
  const orderedTitles = seeAlsoList
    .map(item => {
      const [type, ...rest] = item.split(':');
      if (!type || rest.length === 0) return null;
      if (type === 'article') return 'Articles';
      return makeTitle(rest[0], rest[1], type);
    })
    .filter((title): title is string => title !== null)
    .filter((title) => {
      if (seenTitles.has(title)) return false;
      seenTitles.add(title);
      return true;
    });

  return orderedTitles
    .filter(title => groupedMap.has(title))
    .map(title => ({
      title,
      links: groupedMap.get(title) || [],
    }));
}

export function getSeeAlsoLinksForItem(theItem: any): SeeAlsoLinkGroup[] {
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
        `elements:any:${itemCategoryName}`,
        `article:Scripting_Functions`,
      ];
      break;
    case 'event':
      seeAlso = see_also ?? [];
      addToSeeAlso = [
        `events:any:${itemCategoryName}`,
        `functions:any:${itemCategoryName}`,
        `elements:any:${itemCategoryName}`,
        `article:Scripting_Events`,
      ];
      break;
    case 'element':
      seeAlso = see_also ?? [];
      const elementCategory = getElementCategory(theItem);
      if (elementCategory === 'GUI') {
        // Show GUI functions, events and other GUI element types
        // as well as the Element article
        addToSeeAlso = [
          `functions:any:${elementCategory}`,
          `events:any:${elementCategory}`,
          `elements:any:${elementCategory}`,
          `article:Element`,
        ];
      } else if (elementCategory === 'General') {
        // Also show generic Element functions and events if category is General
        addToSeeAlso = [
          `functions:any:${niceName}`,
          `events:any:${niceName}`,
          `elements:any:${niceName}`,
          `functions:any:Element`,
          `events:any:Element`,
          `article:Element`,
        ];
      }
      else {
        // Show all functions and events for the element type
        // and the Element article
        addToSeeAlso = [
          `functions:any:${niceName}`,
          `events:any:${niceName}`,
          `article:Element`,
        ];
      }
      break;
    default:
      throw new Error('Invalid item type passed');
  }

  const allSeeAlso = [...new Set([...seeAlso, ...addToSeeAlso])];
  return getSeeAlsoLinksFromList(allSeeAlso);
}
