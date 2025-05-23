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

export function getElementCategory(element: ElementItem): string {
    const normalizedPath = path.normalize(element.filePath || '');
    return path.basename(path.dirname(normalizedPath));
}
