# Globerlay-to-Kind-to-Controller Model

The frontmatter of a file should specify, like in Kubernetes, what kind/type of API object it returns. A file where the "body" will be parsed by a converter from Markdown to ipynb will produce the same output as a .json file.

Next is the pipeline that will be used to perform that transformation, which is like a RetroPie "core" or a Wayside "way" or a Whatever the Acebins Superproject Is Pipeline.

So, like, if you've got the "Parse Markdown Into Jupyter" module, you configure the Jupyter "kernel" to parse/present the file with, and all that other metadata that can't make it in. This is maybe an Annotation? I'm not sure how I feel about that API as a necessity yet, tbh

But yeah, you could do these for arbitrary "document to data parsing" tools - but what you can't change is the type of spec the document was written against, and that's its API contract. Your tooling can do whatever to extend it, but... eh idk

Anyway, that's how you get these arbitrary types of document into your system. Then you have some YAML files ir scripts or whatever that define the extensions that render them out or serve them or what

This might involve a Globerlays deal - I think we're starting to converge on a model that the system can work with

So, like, some Globerlays would expect/permit certain Kinds of object, and any unknown Kinds for the applied Overlay are rejected

But see, one of the core ideas with this is that you might have a Notebook in your project that, when processed by three different controllers, simultanteously defines a blog post, a visualization, and the site's operation - one rendering it as content, the other rendering it as a system component. (Because it's both!)

I feel like this was kind of the vision with XML, that a human-readable document could do double-duty and be rich data, but, like... yeah.
