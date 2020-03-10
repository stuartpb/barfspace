# the sensible configuration model

config is defined by states (like selectors) that modify prior values within that context

ie, this is the model used to express something like "change the speed to this percentage of the perimeter speed when printing infill", it'd be like

```
:infill {
  movement-speed: 90%;
}
```

or even

```yaml
- when:
  apply:
    movement-speed: {add: 25, from: whatever} # I'm already bored with this overengineered declarative concept
```

I don't remember JSON patch's real syntax

that's if there's a sensible, clear stack that's understandable. I should think about this some more.

but yeah, a good model should make it clear if your model-specific overrides will apply, or your layer-specific ones. (or, you know, other possible situations where a conflict could be intuited.)
