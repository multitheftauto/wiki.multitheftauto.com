import { getCollection } from 'astro:content';
import path from 'path';

type ElementItem = Awaited<ReturnType<typeof getCollection>>[number];

type ElementsByCategory = {
    [folder: string]: ElementItem[];
};

const elementsCollection = await getCollection('elements');
let elementsByCategory: ElementsByCategory = {};

for (let element of elementsCollection) {
    const normalizedPath = path.normalize(element.filePath || '');
    const folder = path.basename(path.dirname(normalizedPath));
    if (!elementsByCategory[folder]) {
        elementsByCategory[folder] = [];
    }
    elementsByCategory[folder].push(element);
}

export function getElementsByCategory(): ElementsByCategory {
    return elementsByCategory;
}

// Include only those that have data.oop_methods
export function getOOPElementsByCategory(): ElementsByCategory {
    const filteredElements: ElementsByCategory = {};
    for (const [folder, items] of Object.entries(getElementsByCategory())) {
        const filteredItems = items.filter((item) => {
            const data = item.data;
            return data && data.oop_methods && data.oop_methods.length > 0;
        });
        if (filteredItems.length > 0) {
            filteredElements[folder] = filteredItems;
        }
    }
    return filteredElements;
}
export function hasOopMethods(element: ElementItem): boolean {
    const data = element.data;
    return data && data.oop_methods && data.oop_methods.length > 0;
}

export function getElementCategory(element: ElementItem): string {
    const normalizedPath = path.normalize(element.filePath || '');
    return path.basename(path.dirname(normalizedPath));
}
