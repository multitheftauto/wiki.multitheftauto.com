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
    const normalizedPath = path.normalize(event.filePath || '');
    const folder = path.basename(path.dirname(normalizedPath));
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


// Gets related functions and other items (links) according to the see_also field
export function getEventSeeAlsoLinks(
  event: EventItem
): { name: string; link: string }[] {
  let seeAlso: string[] = event.data.see_also || [];
  // Add the event's own category if not already present
  const folder = path.basename(path.dirname(event.filePath || ''));
  const ownSeeAlso = 'events:any:' + folder;
  if (seeAlso && !seeAlso.includes(ownSeeAlso)) {
      seeAlso.push(ownSeeAlso);
  }
  if (!seeAlso || seeAlso.length === 0) {
    return [];
  }

  const links = seeAlso.map((item: string) => {
    const parts = item.split(':');
    if (parts.length !== 3) return null;

    const [itemType, eventType, eventCategory] = parts;
    if (itemType !== 'events') return null;

    let eventsInCategory: EventItem[] = [];

    switch (eventType) {
      case 'client':
        eventsInCategory = eventsByTypeByCategory.client[eventCategory] || [];
        break;
      case 'server':
        eventsInCategory = eventsByTypeByCategory.server[eventCategory] || [];
        break;
      case 'any':
        eventsInCategory = [
          ...(eventsByTypeByCategory.client[eventCategory] || []),
          ...(eventsByTypeByCategory.server[eventCategory] || []),
        ];
        break;
      default:
        return null;
    }

    return eventsInCategory.map(f => ({
      name: f.id,
      link: `/${f.id}`,
    }));
  })
  .filter(linkGroup => linkGroup !== null)
  .flat();

  return links.sort((a, b) => a.name.localeCompare(b.name));
}
