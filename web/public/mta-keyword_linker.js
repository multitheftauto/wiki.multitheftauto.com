let allFunctions = new Set();

const wantedScopes = new Set([
  "support.function.mta-shared",
  "support.function.mta-server",
  "support.function.mta-client",
  "keyword.mta",
  "support.function.library.lua"
]);

function extractFunctions(tmLanguage, textContent) {
  const result = new Set();

  tmLanguage.patterns?.forEach(({ match, name }) => {
    if (!match || !wantedScopes.has(name)) return;

    if (name === "keyword.mta") {
      const regex = new RegExp(match.replace(/\\\\/g, "\\"), "g");
      let m;
      while ((m = regex.exec(textContent)) !== null) {
        if (m[0]) result.add(m[0]);
      }
      return;
    } else if (name === "support.function.library.lua") {
      const regex = /([a-zA-Z0-9_]+)\\?\.\(([^)]+)\)/g;
      const matches = [...match.matchAll(regex)];

      matches.forEach(m => {
        const lib = m[1];
        const funcs = m[2].split("|");
        funcs.forEach(fn => result.add(`${lib}.${fn}`));
      });
      return;
    } else {
      const matches = match.match(/\\b\(([^)]+)\)\\b/)?.[1]?.split("|") || [];
      matches.forEach(w => result.add(w));

      return;
    }
  });

  return Array.from(result);
}

function initKeywordLinker() {
  function onDomReady() {
    const spans = [
      ...document.querySelectorAll(".examples-section .code-example pre code span"),
      ...document.querySelectorAll(".function-syntax span, .expressive-code span")
    ];

    spans.forEach(span => {
      const text = span.textContent;
      if (allFunctions.has(text)) {
        let url = `/reference/${text}`;
        const [lib] = text.split(".");
        if (["string", "math", "table", "os", "debug", "coroutine"].includes(lib)) {
          url = `https://www.lua.org/manual/5.1/manual.html#pdf-${text}`;
        }

        span.innerHTML = `<a href="${url}" class="mta-keyword-link">${text}</a>`;
      }
    });
  }

  fetch('/grammars/lua-mta.tmLanguage.json')
    .then(res => res.json())
    .then(json => {
      const allText = Array.from(
        document.querySelectorAll(".examples-section .code-example pre code, .function-syntax, .expressive-code")
      ).map(el => el.textContent).join("\n");

      allFunctions = new Set(extractFunctions(json, allText));

      document.readyState === "loading"
        ? window.addEventListener("DOMContentLoaded", onDomReady)
        : onDomReady();
    })
    .catch(err => console.error("Failed to load JSON grammar:", err));
}

initKeywordLinker();
