# Browser Extensions and the Extension API

Granted, I've worked with Chrome Extensions before, which is what this API is based on, but [I'm only just now switching to another browser][Firefox], so it's time to start looking into how the rest of the world does it.

[Firefox]: fc7r5-6kzqt-4p9pq-c1jvg-vs8m4

## see also

[my page of browser extension project notes](aqwqk-rbhx4-6vanm-hm867-cfewx)

## links start here

https://addons.mozilla.org/en-US/developers/ being Firefox's hub for all this

https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons being their documentation jumping-off point

https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions summarizing the design

https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Porting_a_Google_Chrome_extension has some notes - the only real change is going to be refactoring to use Promises, which all my newer extensions are designed to do anyway

https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Chrome_incompatibilities continues: I just wanna say, I was *not* expecting the incompatibility list to be *this minor*

https://github.com/mozilla/webextension-polyfill will be the drop-in to accomodate that (all my extension development will be Firefox First like this going forward)

https://browserext.github.io/browserext/

## more links to prominent docs pages

- https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json
- https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Getting_started_with_web-ext#Packaging_your_extension
- https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Package_your_extension_

## note on incompatibility

https://bugzilla.mozilla.org/show_bug.cgi?id=1319168 - this probably affects Rogueport and/or Pull Tool / Rejig
