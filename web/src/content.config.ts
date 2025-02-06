import { defineCollection, z } from 'astro:content';
import { docsLoader, i18nLoader } from '@astrojs/starlight/loaders';
import { docsSchema, i18nSchema } from '@astrojs/starlight/schema';
import { glob } from 'astro/loaders';

export const collections = {
	docs: defineCollection({ loader: docsLoader(), schema: docsSchema() }),
	i18n: defineCollection({ loader: i18nLoader(), schema: i18nSchema({
		extend: z.object({
			'custom.label': z.string().optional()
		})
	}) }),
	elements: defineCollection({
		loader: glob({
			pattern: "**/*.yaml",
			base: "../elements",
			generateId: ({ entry }) => entry.replace(/\.yaml$/, '')
		}),
	}),
	functions: defineCollection({
		loader: glob({
			pattern: "**/*.yaml",
			base: "../functions",
			generateId: ({ entry }) => {
				// Extract the file name without the folder
				return ((entry.split('/') || []).pop() || '').replace(/\.yaml$/, '');
			}
		})
	}),
};
