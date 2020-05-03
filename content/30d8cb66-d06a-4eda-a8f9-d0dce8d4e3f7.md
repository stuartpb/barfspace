# BISNES Model

Starting from Bagtent

Documents detailing a metadata campaign have a `bisnes.model` object providing a schema of keys to descriptions (and maybe even extended validation)

Other documents have objects under that document's UUID (like `bisnes.f6e24fdb-939c-455a-8b5f-44fa300648e3` for metadata requested under the operation described at [f6e24fdb-939c-455a-8b5f-44fa300648e3.md](f6e24fdb-939c-455a-8b5f-44fa300648e3.md))

Take care to not expose documents containing metadata for an operation the agent does not have access to. This is a great opportunity to use separate documents for different facets of a subject.
