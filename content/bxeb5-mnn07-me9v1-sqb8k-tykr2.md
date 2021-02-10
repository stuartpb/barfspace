# Robot friends model

This is the new way I'm modeling my "notestack": as a pipeline of data through the "mdast tree" model used by remark, through to whatever thing converts it to HTML, into something like a Pug template and maybe a straight "Enhanced Markdown module" (where parameters of the page's rendering can be spedcified, and even auto-prerendered if you're sick) that outputs a Markdown representation of the "processed tree"

Each "Robot" summarizes a set of plugins that encapsulate every job that "personality" takes care of in the process. (These can also be thought of as your program's "Gods", and each of these )
