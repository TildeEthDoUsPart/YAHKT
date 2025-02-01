// ==UserScript==
// @name         YAKHT: Yet Another Kinda Hideous Theme
// @namespace    https://github.com/TiildeEthDoUsPart
// @version      1.0
// @description  Fixes the YAKA2027 hideous theme on the intranet
// @author       TildeEthDoUsPart
// @match        *://intra.forge.epita.fr/epita-ing-assistants-yaka*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @run-at       document-start
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    let observer = new MutationObserver(() => {
        document.querySelectorAll('link[rel="stylesheet"]').forEach(link => {
            if (link.href.includes("/epita-ing-assistants-yaka/css")) {
                link.remove();
                console.log("Blocked CSS: " + link.href);
            }
        });
    });

    observer.observe(document, { childList: true, subtree: true });
})();
