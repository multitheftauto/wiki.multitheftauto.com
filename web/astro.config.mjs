// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import mtasaStarlightThemePlugin from '@multitheftauto/starlight-theme-mtasa';
import { SITE_TITLE, SITE_URL } from './src/content.constants';

export default defineConfig({
	site: SITE_URL,
	i18n: {
		locales: ["en", "es", "fr"],
		defaultLocale: "en",
		routing: {
			prefixDefaultLocale: false,
		},
	},
	integrations: [
		starlight({
			plugins: [
				mtasaStarlightThemePlugin(),
			],
			favicon: 'favicon.ico',
			title: SITE_TITLE,
			logo: {
				replacesTitle: true,
				light: './src/assets/images/logo-black.png',
				dark: './src/assets/images/logo-white.png',
			},
            social: [
                { icon: 'github', label: 'GitHub', href: 'https://github.com/multitheftauto/wiki.multitheftauto.com' },
            ],
			components: {
				// Override some default components
				PageTitle: './src/overrides/PageTitle.astro',
				Pagination: './src/overrides/Pagination.astro',
			},
			customCss: [ './src/styles/custom.css' ],
			disable404Route: true,
			sidebar: [
				{
					label: 'Welcome',
					items: [
						{
							label: 'Introduction', link: '/',
						},
						{
							label: 'How you can help', link: '/articles/How_you_can_help',
						},
						{
							label: 'Incomplete Pages', link: '/Incomplete_Pages',
						},
					]
				},
				{
					label: 'Tutorials',
					items: [
						{
							label: 'Scripting Introduction', link: '/articles/Scripting_Introduction',
						},
					]
				},
				{
					label: 'Reference',
					items: [
						{
							label: 'Lua API', link: '/reference/Lua_API',
						},
						{
							label: 'Functions',
							items: [
								{label: 'All Functions', link: '/reference/Scripting_Functions'},
								{label: 'Shared Functions', link: '/reference/Shared_Scripting_Functions'},
								{label: 'Client Functions', link: '/reference/Client_Scripting_Functions'},
								{label: 'Server Functions', link: '/reference/Server_Scripting_Functions'},
							]
						},
						{
							label: 'Events',
							items: [
								{label: 'Event System', link: '/reference/Event_System'},
								{label: 'All Events', link: '/reference/Scripting_Events'},
								{label: 'Client Events', link: '/reference/Client_Scripting_Events'},
								{label: 'Server Events', link: '/reference/Server_Scripting_Events'},
							]
						},
						{
							label: 'Elements',
							items: [
								{label: 'Element Types', link: '/reference/Element'},
								{label: 'Element Tree', link: '/reference/Element_tree'},
								{label: 'Entities', link: '/reference/Entity'},
							]
						},
						{
							label: 'OOP',
							items: [
								{label: 'About OOP', link: '/reference/OOP'},
								{label: 'OOP Classes', link: '/reference/OOP_Classes'},
							]
						},
					]
				},
			],
		}),
	],
});
