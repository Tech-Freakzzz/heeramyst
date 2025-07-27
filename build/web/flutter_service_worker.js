'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2e657dc2d19ce7322eabfd50a21625a7",
"assets/AssetManifest.bin.json": "d7d36985fc8e8edec4ad193160d9daf4",
"assets/AssetManifest.json": "29de5a6d92c8f56ab2f433c1167de75b",
"assets/assets/fonts/raleway/Raleway-Black.ttf": "0560c808e614a5550655e58cf7ff4ed7",
"assets/assets/fonts/raleway/Raleway-BlackItalic.ttf": "432ddc1df57eb5a56dd2d18fca2d064e",
"assets/assets/fonts/raleway/Raleway-Bold.ttf": "9aefa157ae4a8f7ff923dd88cee3917f",
"assets/assets/fonts/raleway/Raleway-BoldItalic.ttf": "9b2fd35772aa95d64c88d655a53a1715",
"assets/assets/fonts/raleway/Raleway-ExtraBold.ttf": "4e37fffb940ad5e5b9b96f59079e2014",
"assets/assets/fonts/raleway/Raleway-ExtraBoldItalic.ttf": "f565acb98bdb33a03052d73c88fe217a",
"assets/assets/fonts/raleway/Raleway-ExtraLight.ttf": "62b913f174cc545320b160b3a64dc6bb",
"assets/assets/fonts/raleway/Raleway-ExtraLightItalic.ttf": "429362d36a625285ba2e28b864e3c834",
"assets/assets/fonts/raleway/Raleway-Italic.ttf": "1d1c86fde9011633aa535eaaaef72a17",
"assets/assets/fonts/raleway/Raleway-Light.ttf": "1aa2abd0c1ee7d067e6df27f82f1f0b2",
"assets/assets/fonts/raleway/Raleway-LightItalic.ttf": "f3c1507fc3d8231fa7011d827acd214b",
"assets/assets/fonts/raleway/Raleway-Medium.ttf": "28ea37f0eb58c57e01eed0b06fc359d6",
"assets/assets/fonts/raleway/Raleway-MediumItalic.ttf": "d6065512496d659bed12898032ea8729",
"assets/assets/fonts/raleway/Raleway-Regular.ttf": "6310192cd2011f527e18b1586a1245c8",
"assets/assets/fonts/raleway/Raleway-SemiBold.ttf": "66c9748f1e4aae2e764d5c50c05f7841",
"assets/assets/fonts/raleway/Raleway-SemiBoldItalic.ttf": "26c32288806ad88dffc2bbe30dc6f4f3",
"assets/assets/fonts/raleway/Raleway-Thin.ttf": "d10da33944a69e7951077d2e9c1fdd16",
"assets/assets/fonts/raleway/Raleway-ThinItalic.ttf": "fe397b9bebda4ab94ed5f5af6c924551",
"assets/assets/images/brand_logo.png": "8ff675f055a976fa3f3c27530a96bd34",
"assets/assets/images/coins.png": "58ed70650d5e6d6b38d716056365eb23",
"assets/assets/images/lipstick.png": "dac597123a0e428635496cb24647ace1",
"assets/assets/images/model.jpg": "8a7fbb680f45e597c27b0eba2824f5f1",
"assets/assets/images/whatsapp.png": "372ebb2a3d9861a5ff4c5cdab3405810",
"assets/FontManifest.json": "3f18d0e1d276f8580fabc898c21d4126",
"assets/fonts/MaterialIcons-Regular.otf": "aa157b404eb04c7060167b900e916563",
"assets/NOTICES": "7f673730900047942f728fe9f06d3f75",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "e89d68260fc50d5240aec3b490b5c7be",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b655916f3a7da0f187f2d0b20f6134a4",
"/": "b655916f3a7da0f187f2d0b20f6134a4",
"main.dart.js": "24c40088019e457ba77f633e725328e8",
"manifest.json": "a0b62f0291d85c83dcd6765596dacb9d",
"version.json": "739ab599dabd2042cff695b7c48a6dd8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
