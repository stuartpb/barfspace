# When And How You Need Font Stacks

## Background: What is a font stack?

A font stack is a list of fonts to try in rendering an element on the page. If the first one isn't available, the browser will try the second, and so on.

Most modern font stacks are just the web font in use, followed by the generic type of font to use instead of it.

However, there are times where you'll need to build an *actual, curated* font stack

## Font Stacks? What year is it?

"But Stuart", I hear you ask, "why would anyone need to care what fonts are available on the system in the age of Web Font support?"

The answer: **fucking email**. You *still* have to build a fallback font into messages, because Gmail (and Fastmail and probably others) *still doesn't support web fonts* - and neither do many mobile clients.

http://stylecampaign.com/blog/2015/02/webfont-support-in-email/ is highly misleading about this.

## How do we solve it?

Font Family Reunion.

Its one failing is that it doesn't render text on the backend as a preview to avoid licensing issues if the font isn't on the client machine.

Also, [it could stand to know about ChromeOS](https://github.com/zachleat/font-family-reunion/issues/49)

or [popular applications that may be installed among your audience](t76xk-k0sc5-ceabw-0ne91-xdtja)

## Finding this information

(TODO: drop this section in the next commit, finding FFR made it obsolete)

The state of documentation on this *sucks* - the best starting point for documenting this that I could find is [this matrix from a 24 Ways article in 2007](http://media.24ways.org/2007/17/fontmatrix.html), and that is *leaps and bounds* ahead of the next runners-up, even ones that have emerged in the *decade-plus* since it was written.

[this page](http://www.ampsoft.net/webdesign-l/WindowsMacFonts.html):

- only newer by about a year
- doesn't present a comprehensive matrix
- More clear about caveats that were applicable in 2008, but how much use is that today?

It does, however, suggest

## Similar information

- Which fonts were system defaults for things in various themes, etc
- the Wikipedia font lists
