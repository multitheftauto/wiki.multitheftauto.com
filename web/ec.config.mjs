import fs from 'fs';

export default {
  themes: [
    JSON.parse(fs.readFileSync('./src/themes/mtasa_lua-theme_dark.json', 'utf-8')),
    JSON.parse(fs.readFileSync('./src/themes/mtasa_lua-theme_light.json', 'utf-8')),
  ],
  shiki: {
    langs: [
      {
        id: 'lua',
        scopeName: 'source.lua.mta',
        ...JSON.parse(fs.readFileSync('./src/grammars/lua-mta.tmLanguage.json', 'utf-8')),
      },
    ],
  },
};
