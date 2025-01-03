'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9f36ed7dd99d3ce5820e0f861968e659",
"assets/AssetManifest.bin.json": "21f85814fd0d6e22b4bfd6a48c5a6f40",
"assets/AssetManifest.json": "e722e69867a7250b80fcb79ed6b6b4e2",
"assets/assets/Arrows%2520-%2520clockwise.png": "18af29682b0fcd2c2f3b9ede4f0da3f9",
"assets/assets/Bell.png": "beae98b4ac1e0ccd13acb5f174f1b7ac",
"assets/assets/clarity_two-way-arrows-line.png": "1959cf97c831eabe232cc302b69c6662",
"assets/assets/Edit.png": "9e018262bee17cfa95a95534af3a28b0",
"assets/assets/failed.png": "4ab507c207293d58fc9f75b74807ad3d",
"assets/assets/Frame%252047.png": "2be6d6e60b8bc8ac1fd1e4cf19cd65f1",
"assets/assets/google.png": "f17a04cb60c90a91b5b57a9c29438f9a",
"assets/assets/Group%25201261154323.png": "f592798dc58209d47636ebda3c65f13c",
"assets/assets/Group%25201261154327.png": "095382b341f4e63fa7553d959eaf9e32",
"assets/assets/Group%252023%25201.png": "3fc5fed6af69949a3b856db981819741",
"assets/assets/Group%2520265.png": "490d905ff37b34ce9bd4e5ecde09cb79",
"assets/assets/Group%2520268.png": "ead4636524036cb4649d194f25fcbb3a",
"assets/assets/hugeicons_security-lock.png": "3bdcac3f5ba9975772d6c8c5d2f291e3",
"assets/assets/Icon%2520(1).png": "fd7ac5a035ef2cd4ced19c25eba8fc5a",
"assets/assets/Icon%2520(2).png": "1ebfcc0acacb26b7911c690251fce085",
"assets/assets/Icon%2520(3).png": "1ebfcc0acacb26b7911c690251fce085",
"assets/assets/Icon.png": "82270a00270afd1d8423078ac097bf33",
"assets/assets/image%252010.png": "35a5c6241870386e9033555e95648590",
"assets/assets/Image.png": "a1087ac828ee8c99cb4909b7898c6fba",
"assets/assets/location.png": "71a31fa8bb31823b7f0a96f9f3566083",
"assets/assets/Medium.png": "78e2d703cb14e92c5ae4688c35a07dab",
"assets/assets/Paper.png": "11e02dad8837db6e8821d5bbf2898eb1",
"assets/assets/splasah.png": "3cdc30b77dde41a55076018c50b90f38",
"assets/assets/succes.png": "8acf17cfeda3e19c7014973912d1587a",
"assets/assets/Time%2520Circle.png": "08af6da34d079dd680d05d7df091b512",
"assets/assets/vector.png": "db8b1361b83a05c602eba45dd369527c",
"assets/assets/Vector1.png": "0d894774bf6f9b21fc19b46deadbce2b",
"assets/FontManifest.json": "8f63e180358c8e341f054274b346e6b0",
"assets/fonts/Inter-VariableFont_opsz,wght.ttf": "0a77e23a8fdbe6caefd53cb04c26fabc",
"assets/fonts/MaterialIcons-Regular.otf": "55aeaec5e0303821afea4bfbd55d067a",
"assets/NOTICES": "aa5dff4821e19e7d9d7eb6c06455929d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "71a0c7cdcd6fe05b523ff5f4718263fa",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "506da6e94aa614acbc797c8f1dc76f7b",
"/": "506da6e94aa614acbc797c8f1dc76f7b",
"main.dart.js": "0fa884675f5b140b2220e7c8639ff12e",
"manifest.json": "92ce6637e62e12af670ca4082ee3c36e",
"version.json": "88642b53b41b54d1bdcd5b0ea8cf7ed9"};
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
