import { readFileSync } from 'fs';

import githubDark from 'tm-themes/themes/github-dark.json' with { type: 'json' };
const mtaLuaDark = JSON.parse(readFileSync('./src/themes/mtasa_lua-theme_dark.json', 'utf-8'));

const hybridTheme = {
  ...githubDark,
  tokenColors: [
    ...githubDark.tokenColors,
    ...mtaLuaDark.tokenColors,
  ],
  colors: [mtaLuaDark.colors]
};

export default {
  themes: [hybridTheme],
  shiki: {
    langs: [
      {
        id: 'lua',
        scopeName: 'source.lua.mta',
        ...JSON.parse(readFileSync('./src/grammars/lua-mta.tmLanguage.json', 'utf-8')),
      },
    ],
  },
};
