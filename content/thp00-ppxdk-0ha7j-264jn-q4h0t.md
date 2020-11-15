# Markdown-first resume

This is an idea for [an overhaul of my resume system](qgznq-4k24g-009pj-vn668-f9b88), specifically from the standpoint of its first-class data structure:

## Primer / loose thoughts

- I've been thinking that it'd be better to have my resume's native format be Markdown instead of YAML
  - new processor for converting resumes from a Markdown format (a la API Blueprint) to hResume
    - or, really, from semantic HTML to explicit hResume
      - which could then probably translate to JSON Resume et al
    - this could use something like [rehype](https://github.com/rehypejs/rehype)
  - I'd need a component that can reliably break up names and addresses
    - or just hard-code the hResume spans for it

## Prior art

Lots of stuff comes up when doing a Google search for "markdown resume":

- https://github.com/there4/markdown-resume
  - ported to Node as https://www.npmjs.com/package/markdown-resume
    - used [here](https://www.davidhampgonsalves.com/painless-resumes-with-markdown/)
  - semantic abuses:
    - bold for headings
    - heavily-indented "paragraph continuation" to signify items under a listing
- [another JS approach](https://dev.to/stephencorwin/comment/35nn)
  - might be using markdown-resume under the hood? similar
- [Pretz's MultiMarkdown-based implementation](http://pretzlav.com/blog/2015/11/06/markdown-resume/)
- [pandoc approach](https://mszep.github.io/pandoc_resume/)
  - uses bold paragraphs instead of headings
  - definition lists as the structure for non-sequential subclasses
- [A multi-file Pandoc-and-LaTeX approach](https://www.chainsawonatireswing.com/2013/05/28/how-i-create-manage-my-cv-using-markdown-pandoc/)
    - also uses bold paragraphs as headings
- https://elipapa.github.io/markdown-cv/ to do it with a Jekyll plugin
  - lots of weird semantic violations (ie. code spans to represent dates)
  - https://blm.io/blog/markdown-academic-cv/ covers this in use
- for R people: https://www.r-bloggers.com/vitae-dynamic-cvs-with-r-markdown/
  - [another R-based approach](https://joshuamrosenberg.com/blog/creating-a-cv-while-using-blogdown-pdf-html-and-word-doc-oh-my/)
    - [document is mostly bare paragraphs](https://github.com/jrosen48/utk-homepage/blob/master/static/cv/rosenberg-cv-for-word.Rmd)
- https://www.monique.tech/the-art-of-markdown kludges a bunch of unrelated generic-primers together
- [this browser-based authoring tool in an archived GitHub repo](https://github.com/awalGarg/cv-maker/)

## Related

This might also make sense as part of an overall rework of my website to be statically-rendered (possibly on a schedule to keep the hair first-render up to date, via GitLab's cron CI features)

This overlaps the conceptual node for [Semantic Markdown](c0g5q-c0kq9-tgaaw-avh15-004rm)

Could consider conversion to [JSON Resume](https://jsonresume.org/)
