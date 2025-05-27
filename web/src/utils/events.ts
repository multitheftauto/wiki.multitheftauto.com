import { getCollection } from 'astro:content';
import path from 'path';

type EventItem = Awaited<ReturnType<typeof getCollection>>[number];

type EventsByCategory = {
    [folder: string]: EventItem[];
};

type EventsByTypeByCategory = {
    client: EventsByCategory;
    server: EventsByCategory;
};

const eventsCollection = await getCollection('events');
let eventsByCategory: EventsByCategory = {};
let eventsByTypeByCategory: EventsByTypeByCategory = {
    client: <EventsByCategory>{},
    server: <EventsByCategory>{}
};

for (let event of eventsCollection) {
    let folder = path.basename(path.dirname(event.filePath || ''));
    folder = folder.replace(/_/g, ' ');

    if (!eventsByCategory[folder]) {
        eventsByCategory[folder] = [];
    }
    eventsByCategory[folder].push(event);

    const eventType = event.data.type === 'client' ? 'client' : 'server';
    if (!eventsByTypeByCategory[eventType][folder]) {
        eventsByTypeByCategory[eventType][folder] = [];
    }
    eventsByTypeByCategory[eventType][folder].push(event);
}

export function getEventTypePretty(eventType: string): string {
    return eventType.charAt(0).toUpperCase() + eventType.slice(1);
}

export function getEventsByCategory(): EventsByCategory {
    return eventsByCategory;
}

export function getEventsByTypeByCategory(): EventsByTypeByCategory {
    return eventsByTypeByCategory;
}
