let allFunctions = new Set();

function extractFunctions(tmLanguage) {
  const wantedScopes = new Set([
    "support.function.mta-shared",
    "support.function.mta-server",
    "support.function.mta-client",
    "keyword.mta"
  ]);

  return tmLanguage.patterns?.reduce((funcs, { match, name }) => {
    if (match && wantedScopes.has(name)) {
      funcs.push(...match.match(/\\b\(([^)]+)\)\\b/)?.[1]?.split("|") || []);
    }
    return funcs;
  }, []) || [];
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
        span.innerHTML = `<a href="/${text}" class="mta-keyword-link">${text}</a>`;
      }
    });
  }

  fetch('/lua-mta.tmLanguage.json')
    .then(res => res.json())
    .then(json => {
      allFunctions = new Set(extractFunctions(json));
      document.readyState === "loading"
        ? window.addEventListener("DOMContentLoaded", onDomReady)
        : onDomReady();
    })
    .catch(err => console.error("Failed to load JSON grammar:", err));
}

initKeywordLinker();
