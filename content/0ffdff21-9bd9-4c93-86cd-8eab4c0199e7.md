# very minor VS code tweak

removed the removal rules for ctrl+shift+c (copy in terminal) and ctrl+\] (indent lines)

this is what my keybindings.json looks like now:

```json
// Place your key bindings in this file to override the defaultsauto[]
[
  {
    "key": "ctrl+c",
    "command": "workbench.action.terminal.copySelection",
    "when": "terminalFocus && terminalTextSelected"
  },
  {
    "key": "tab",
    "command": "editor.action.indentLines",
    "when": "editorTextFocus && !editorReadonly"
  }
]
```
