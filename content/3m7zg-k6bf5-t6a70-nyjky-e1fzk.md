# odd thought on serialization format structure

(Popping off from [this messay](m2mw3-h1zf4-04am5-cfwg7-byz8w))

Are space-indent-structured languages like YAML a kind of "base-1 run encoding"?

Is there a spec for an HTML tree-like representation form that uses that number format I remember the Dat protocol using that works like Protocol Buffers that operates on this "here's a new node at this level" additive format (maybe terminating with a lone "0" to end the document?)

in this case, the structure would be integer, string, list of string pairs (to be treated as a map - duplicates follow whatever logic the HTML parse spec describes)

Maybe instead of an integer, just a string as the first item of the list
