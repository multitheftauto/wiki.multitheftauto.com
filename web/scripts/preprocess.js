import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const srcDir = path.resolve(__dirname, '../../assets');
const destDir = path.resolve(__dirname, '../src/assets');

function deleteDirRecursive(dirPath) {
  if (fs.existsSync(dirPath)) {
    for (const entry of fs.readdirSync(dirPath)) {
      const entryPath = path.join(dirPath, entry);
      const stats = fs.lstatSync(entryPath);

      if (stats.isDirectory()) {
        deleteDirRecursive(entryPath);
      } else {
        fs.unlinkSync(entryPath);
      }
    }
    fs.rmdirSync(dirPath);
  }
}

function copyDirRecursive(src, dest) {
  if (!fs.existsSync(dest)) {
    fs.mkdirSync(dest, { recursive: true });
  }

  for (const entry of fs.readdirSync(src)) {
    const srcPath = path.join(src, entry);
    const destPath = path.join(dest, entry);
    const stats = fs.lstatSync(srcPath);

    if (stats.isDirectory()) {
      copyDirRecursive(srcPath, destPath);
    } else {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

import('../mta_highlighting/generate-lua-tmlanguage.js')
.then(() => {
  deleteDirRecursive(destDir);
  copyDirRecursive(srcDir, destDir);
  // console.log(`Copied assets from "${srcDir}" to "${destDir}".`);
});
