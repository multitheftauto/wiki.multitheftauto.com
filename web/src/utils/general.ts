import { marked } from 'marked';
import path from 'path';
import { getFunctionsByCategory, getFunctionsByTypeByCategory } from '@src/utils/functions';
import { getEventsByCategory, getEventsByTypeByCategory } from '@src/utils/events';
import { getElementsByCategory, getElementCategory } from '@src/utils/elements';

import type { ImageMetadata } from 'astro';

const imagesFromAssets = import.meta.glob<{ default: ImageMetadata }>('/src/assets/images/**/*.{jpeg,jpg,png,gif,webp}');
export function getAssetImagePath(imageFilename: string): any {
  const imagePath = `/src/assets/images/${imageFilename}`;
  if (imagesFromAssets[imagePath]) {
    return imagesFromAssets[imagePath]();
  } else {
    throw new Error(`Image not found: ${imageFilename}`);
  }
}

export function renderInlineMarkdown(markdown: string): string | Promise<string> {
  const html = marked.parseInline(markdown);
  return html;
}

type SeeAlsoLink = {
  name: string;
  link: string;
  newTab?: boolean;
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

const getReferencePagesByCategory = (type: string, subType: string, category: string): any[] => {
  const findCategoryInsensitive = (obj: Record<string, any[]>, cat: string): any[] => {
    const match = Object.keys(obj).find(key => key.toLowerCase() === cat.toLowerCase());
    return match ? obj[match] : [];
  };

  switch (type) {
    case 'functions': {
      const fnByType = getFunctionsByTypeByCategory();
      if (subType === 'any') {
        return [
          ...findCategoryInsensitive(fnByType.shared || {}, category),
          ...findCategoryInsensitive(fnByType.client || {}, category),
          ...findCategoryInsensitive(fnByType.server || {}, category),
        ];
      }
      return findCategoryInsensitive(fnByType?.[subType as keyof typeof fnByType] || {}, category);
    }

    case 'events': {
      const evByType = getEventsByTypeByCategory();
      if (subType === 'any') {
        return [
          ...findCategoryInsensitive(evByType.client || {}, category),
          ...findCategoryInsensitive(evByType.server || {}, category),
        ];
      }
      return findCategoryInsensitive(evByType?.[subType as keyof typeof evByType] || {}, category);
    }

    case 'elements': {
      const elementsByCategory = getElementsByCategory();
      return findCategoryInsensitive(elementsByCategory || {}, category);
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

    if (type === 'article') {
      const articleName = rest[0];
      const title = 'Articles';
      if (!groupedMap.has(title)) groupedMap.set(title, []);
      groupedMap.get(title)!.push({ name: articleName, link: `/articles/${articleName}` });
      continue;
    }
    if (type === 'reference') {
      const refPage = rest[0];
      const title = 'Reference';
      if (!groupedMap.has(title)) groupedMap.set(title, []);
      groupedMap.get(title)!.push({ name: refPage, link: `/reference/${refPage}` });
      continue;
    }
    if (type === 'external') {
      const title = rest[0];
      const httpprefix = rest[1];
      const url = httpprefix + ':' + rest[2];
      if (!groupedMap.has('Links')) groupedMap.set('Links', []);
      groupedMap.get('Links')!.push({ name: title, link: url, newTab: true });
      continue;
    }

    // Handle function/event style links
    const [subType, category] = rest;
    const items = getReferencePagesByCategory(type, subType, category);
    if (!items.length) continue;

    const title = makeTitle(subType, category, type);
    if (!groupedMap.has(title)) groupedMap.set(title, []);
    const links = items.map((i: any) => ({ name: i.id, link: `/reference/${i.id}` }));
    groupedMap.get(title)!.push(...links);
  }

  for (const links of groupedMap.values()) {
    links.sort((a, b) => a.name.localeCompare(b.name));
  }
  
  // Preserve input order for group titles
  const seenTitles = new Set<string>();
  const orderedTitles = seeAlsoList
    .map(item => {
      const [type, ...rest] = item.split(':');
      if (!type || rest.length === 0) return null;
      if (type === 'article') return 'Articles';
      if (type === 'reference') return 'Reference';
      if (type === 'external') return 'Links';
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
        `reference:Scripting_Functions`,
      ];
      break;
    case 'event':
      seeAlso = see_also ?? [];
      addToSeeAlso = [
        `events:any:${itemCategoryName}`,
        `functions:any:${itemCategoryName}`,
        `elements:any:${itemCategoryName}`,
        `reference:Scripting_Events`,
      ];
      break;
    case 'element':
      seeAlso = see_also ?? [];
      const elementCategory = getElementCategory(theItem);
      addToSeeAlso = [
        `functions:any:${niceName}`,
        `events:any:${niceName}`,
        `elements:any:${niceName}`,
        `functions:any:${elementCategory}`,
        `events:any:${elementCategory}`,
        `elements:any:${elementCategory}`,
      ];
      if (itemCategoryName === 'Entity') {
        // Add generic element function and events for Entities
        addToSeeAlso.push(
          `functions:any:Element`,
          `events:any:Element`,
        );
      }
      addToSeeAlso.push(`reference:Element`);
      break;
    default:
      throw new Error('Invalid item type passed');
  }

  const allSeeAlso = [...new Set([...seeAlso, ...addToSeeAlso])];
  return getSeeAlsoLinksFromList(allSeeAlso);
}

export function extractVersion(versionString: string): string | null {
  const match = versionString?.match(/^(\d+\.\d+\.\d+)/);
  return match ? match[1] : null;
}

export function isVersionLE(v: string, ref: string): boolean {
  const toNums = (str: string) => str.split('.').map(n => parseInt(n, 10));
  const [a1, a2, a3] = toNums(v);
  const [b1, b2, b3] = toNums(ref);
  if (a1 !== b1) return a1 < b1;
  if (a2 !== b2) return a2 < b2;
  return a3 <= b3;
}

export function renderRevisionLink(versionRaw: string) {
  const match = versionRaw.match(/r(\d+)/);
  if (!match) return versionRaw;

  const revisionNumber = match[1];
  const beforeRevision = versionRaw.slice(0, match.index);
  const url = `https://buildinfo.mtasa.com/?Author=&Branch=&Revision=${revisionNumber}`;

  return `${beforeRevision}<a href="${url}" target="_blank" rel="noopener noreferrer">r${revisionNumber}</a>`;
}