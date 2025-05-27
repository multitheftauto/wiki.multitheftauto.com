# Multi Theft Auto: Wiki [Web]

## License

The source code in this directory [(/web)](/web) is licensed under the GPLv3 license. See the [LICENSE](./LICENSE) file for more details.

## Development

Requires [Node.js](https://nodejs.org) version `20` or higher (`node -v` to check).

The site is built with [Astro](https://astro.build) and the [Starlight](https://starlight.astro.build) expansion.

All commands are run from the root of the web project (this folder), from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## Deployment

This static site is served with CloudFlare Pages (this is not managed on this repository), which uses Node.js to build the site and then serves the static files from the `dist` folder.
