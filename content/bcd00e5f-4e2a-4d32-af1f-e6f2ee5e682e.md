# Console Output Markdown Highlight mode

Console Output highlighting mode? It looks for prompt lines (like, maybe that's any line with some text that includes a pair of square braces followed by a $ or #?) and then determines the command being run, and highlights lines until the next prompt line accordingly

I feel like there are just a lot of edge cases that this inherently can't handle (what if I cat a previous terminal session and an arbitrary text document? how can you tell the difference in prompts)

what if you used a fenceline to specify extended parameters, like a heredoc word?
