// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import mtasaStarlightThemePlugin from '@multitheftauto/starlight-theme-mtasa';
import { SITE_TITLE, SITE_URL } from './src/content.constants';
import { readFileSync, writeFileSync, mkdirSync, copyFileSync, existsSync } from 'fs';
import { join } from 'path';


export default defineConfig({
	site: SITE_URL,
	redirects: {
		// External redirects only, the others are handled by CloudFlare pages (_redirects file)
		"/How_you_can_help": "https://github.com/multitheftauto/wiki.multitheftauto.com/blob/main/CONTRIBUTING.md",
	},
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
				light: './src/assets/logo-black.png',
				dark: './src/assets/logo-white.png',
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
					label: 'Start here',
					translations: {
						es: 'Empeza aquí',
						fr: 'Commence ici',
					},
					items: [
						{
							label: 'Introduction', link: '/',
							translations: {
								es: 'Introducción',
								fr: 'Introduction',
							},
						},
					]
				},
				{
					label: 'Reference',
					items: [
						{
							label: 'Lua API', link: 'Lua_API',
						},
						{
							label: 'Functions',
							items: [
								{label: 'All functions', link: 'Scripting_Functions'},
								{label: 'Shared functions', link: 'Shared_Scripting_Functions'},
								{label: 'Client functions', link: 'Client_Scripting_Functions'},
								{label: 'Server functions', link: 'Server_Scripting_Functions'},
							]
						},
						{
							label: 'Events',
							items: [
								{label: 'All events', link: 'Scripting_Events'},
								{label: 'Client events', link: 'Client_Scripting_Events'},
								{label: 'Server events', link: 'Server_Scripting_Events'},
							]
						},
						{
							label: 'Elements',
							items: [
								{label: 'Element types', link: 'Element'},
								{label: 'Element tree', link: 'Element_tree'},
								{label: 'Entity', link: 'Entity'},
							]
						},
						{
							label: 'OOP',
							items: [
								{label: 'About OOP', link: 'OOP_Introduction'},
								{label: 'OOP Classes', link: 'OOP_Classes'},
							]
						},
					]
				},
			],
		}),
	],

	vite: {
		plugins: [
			{
				name: 'override-pagefind-config',
				writeBundle: {
					sequential: true,
					order: 'post',
					handler: async () => {
						console.log('⏳ Konfiguruję PageFind...');

						const targetDir = join('dist', 'pagefind');
						const sourceDir = join('dist', '_pagefind');

						if (!existsSync(targetDir)) mkdirSync(targetDir, { recursive: true });

						const filesToCopy = ['pagefind.js', 'pagefind.json', 'pagefind-*.wasm'];
						filesToCopy.forEach(pattern => {
							try {
								const sourcePath = join(sourceDir, pattern.replace('*', ''));
								if (existsSync(sourcePath)) {
									copyFileSync(
										sourcePath,
										join(targetDir, pattern.replace('*', ''))
									);
									console.log(`📁 Skopiowano ${pattern}`);
								}
							} catch (error) {
								console.warn(`⚠️ Nie udało się skopiować ${pattern}:`, error.message);
							}
						});

						const configPath = join(targetDir, 'pagefind.json');
						if (existsSync(configPath)) {
							const config = JSON.parse(readFileSync(configPath, 'utf-8'));
							config.source = 'pages';
							writeFileSync(configPath, JSON.stringify(config));
							console.log('⚙️ Zaktualizowano ścieżkę źródłową (pages)');
						} else {
							writeFileSync(configPath, JSON.stringify({
								source: 'pages',
								bundlePath: '/pagefind/'
							}));

							console.log('⚙️ Utworzono nową konfigurację PageFind');
						}

						console.log('✅ Konfiguracja PageFind zakończona');
					}
				}
			}
		]
	}
});
