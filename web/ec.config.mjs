import { readFileSync } from 'fs';

import githubDark from 'tm-themes/themes/github-dark.json' with { type: 'json' };
import githubLight from 'tm-themes/themes/github-light.json' with { type: 'json' };

const mtaLuaDark = JSON.parse(readFileSync('./src/themes/mtasa_lua-theme_dark.json', 'utf-8'));
const mtaLuaLight = JSON.parse(readFileSync('./src/themes/mtasa_lua-theme_light.json', 'utf-8'));

const hybridDarkTheme = {
  ...githubDark,
  tokenColors: [
    ...githubDark.tokenColors,
    ...mtaLuaDark.tokenColors,
  ],
  colors: {
    ...githubDark.colors,
    ...mtaLuaDark.colors
  }
};

const hybridLightTheme = {
  ...githubLight,
  tokenColors: [
    ...githubLight.tokenColors,
    ...mtaLuaLight.tokenColors,
  ],
  colors: {
    ...githubLight.colors,
    ...mtaLuaLight.colors
  }
};

export default {
  themes: [hybridDarkTheme, hybridLightTheme],
  minSyntaxHighlightingColorContrast: 4.5,
  shiki: {
    langs: [
      {
        id: 'lua',
        scopeName: 'source.lua.mta',
        ...JSON.parse(readFileSync('./src/grammars/lua-mta.tmLanguage.json', 'utf-8')),
      },
    ]
  }
};