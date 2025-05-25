import fs from 'fs';
import path from 'path';
import yaml from 'js-yaml';
import { glob } from 'glob';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const functionsDir = path.resolve(__dirname, '../../functions');
const basePath = path.resolve(__dirname, './lua-base.tmLanguage.json');
const outputPath = path.resolve(__dirname, '../src/grammars/lua-mta.tmLanguage.json');
const publicPath = path.resolve(__dirname, '../public/grammars/lua-mta.tmLanguage.json');

const mtaKeywords = ['string','bool','boolean','number','int','float','element','player','vehicle','ped','object','building'];

function extractFunctionsWithScope(yamlContent) {
  if (yamlContent.shared?.name) {
    return [{ name: yamlContent.shared.name, scope: 'support.function.mta-shared' }];
  } else if (yamlContent.client?.name) {
    return [{ name: yamlContent.client.name, scope: 'support.function.mta-client' }];
  } else if (yamlContent.server?.name) {
    return [{ name: yamlContent.server.name, scope: 'support.function.mta-server' }];
  }
  return [];
}

async function generateTmLanguage() {
  const files = await glob('**/*.yaml', { cwd: functionsDir, absolute: true });

  const functionsMap = Object.fromEntries(
    ['shared', 'server', 'client'].map(scope => [`support.function.mta-${scope}`, new Set()])
  );

  files.forEach(file => {
    const yamlContent = yaml.load(fs.readFileSync(file, 'utf-8'));
    console.log('Processing file:', file);

    const items = Array.isArray(yamlContent) ? yamlContent : [yamlContent];
    items.flatMap(extractFunctionsWithScope).forEach(({ name, scope }) => functionsMap[scope].add(name));
  });

  const patterns = Object.entries(functionsMap)
    .filter(([, namesSet]) => namesSet.size > 0)
    .map(([scope, namesSet]) => ({
      match: `\\b(${Array.from(namesSet).join('|')})\\b`,
      name: scope,
    }));

  if (mtaKeywords.length > 0) {
    patterns.push({
      match: `\\b(${mtaKeywords.join('|')})\\b`,
      name: 'keyword.mta',
    });
  }

  const baseGrammar = JSON.parse(fs.readFileSync(basePath, 'utf-8'));
  baseGrammar.patterns = [...patterns, ...(baseGrammar.patterns || [])];

  // Ensure the directoroes exist
  fs.mkdirSync(path.dirname(outputPath), { recursive: true });
  fs.mkdirSync(path.dirname(publicPath), { recursive: true });

  // Write the updated grammar to the output file
  fs.writeFileSync(outputPath, JSON.stringify(baseGrammar, null, 2));
  
  // Create file also in public directory for clickable keywords
  fs.copyFileSync(outputPath, publicPath);
  
  console.log(`Done!`);
}

generateTmLanguage();
