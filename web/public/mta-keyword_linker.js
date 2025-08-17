let allFunctions = new Set();

function extractFunctions(tmLanguage, textContent) {
  const result = new Set();

  tmLanguage.patterns?.forEach(({ match, name }) => {
    if (!match) return;

    if (name === "keyword.mta") {
      const regex = new RegExp(match.replace(/\\\\/g, "\\"), "g");
      let m;
      while ((m = regex.exec(textContent)) !== null) {
        if (m[0]) result.add(m[0]);
      }
    } else {
      const matches = match.match(/\\b\(([^)]+)\)\\b/)?.[1]?.split("|") || [];
      matches.forEach(w => result.add(w));
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
        span.innerHTML = `<a href="/reference/${text}" class="mta-keyword-link">${text}</a>`;
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
