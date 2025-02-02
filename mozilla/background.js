browser.webRequest.onBeforeRequest.addListener(
    function(details) {
        console.log("Blocked CSS:", details.url);
        return { cancel: true }; // Blocks the request
    },
    { urls: ["*://intra.forge.epita.fr/epita-ing-assistants-yaka/css"], types: ["stylesheet"] },
    ["blocking"]
);

