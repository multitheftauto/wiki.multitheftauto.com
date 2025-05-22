import { getCollection } from 'astro:content';
import path from 'path';

type OOPClassItem = Awaited<ReturnType<typeof getCollection>>[number];

type OOPClassesByCategory = {
    [folder: string]: OOPClassItem[];
};

const oopClassesCollection = await getCollection('classes');
let classesByCategory: OOPClassesByCategory = {};

for (let oopClass of oopClassesCollection) {
    const normalizedPath = path.normalize(oopClass.filePath || '');
    const folder = path.basename(path.dirname(normalizedPath));
    if (!classesByCategory[folder]) {
        classesByCategory[folder] = [];
    }
    classesByCategory[folder].push(oopClass);
}

export function getOOPClassesByCategory(): OOPClassesByCategory {
    return classesByCategory;
}
