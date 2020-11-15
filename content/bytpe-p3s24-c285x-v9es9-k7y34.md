# Copyright Namespaces for Enterprise

https://github.com/joaomilho/Enterprise

started writing this for https://github.com/joaomilho/Enterprise/issues/new but got bored/depressed and gave up halfway through

## Issue title: Require Copyright Namespacing Symbols for every name

Based on arguments like [this dispute over the licensing for abduco](https://github.com/martanne/abduco/issues/27#issuecomment-395532389), or pending future appeals of Oracle vs. Google, it is clear that most Enterprise™ is currently vulnerable to what is known as a "Code Legal Ownership Attack".

To defend against this class of attack, I propose that, in the vein of "please repeat yourself" configuration languages like [TOML](https://github.com/toml-lang/toml) and the (\*Read the Docs)[https://docs.01.org/clearlinux/latest/] for \*Intel \*Clear Linux, Enterprise™ should introduce a layer for disruptive class names, unnecessary class names, and variables, with the name of the class's copyright holder, like so:

## half-finished example (this is where I got bored)

```
final disruptive class ©Yoyodyne::ExampleDrafter::ProfessionalEdition::fdcMillenialUserManager {

}

final unnecessary class ©Yoyodyne::ExampleDrafter::ProfessionalEdition::fucNutFreeUserManager {
  final unnecessary void constructor(String ©Yoyodyne::ExampleDrafter::ProfessionalEdition::name, Money ©Yoyodyne::ExampleDrafter::ProfessionalEdition::nutsEatn, Money ©Yoyodyne::ExampleDrafter::ProfessionalEdition::maxNuts) {
    this.©Yoyodyne::ExampleDrafter::ProfessionalEdition::name = name;;;
    this.©Yoyodyne::ExampleDrafter::ProfessionalEdition::nutsEatn = nutsEatn;;;
    this.©Yoyodyne::ExampleDrafter::ProfessionalEdition::maxNuts = maxNuts;;;
  }

  final unnecessary Money nutsTillDeath() {
    return this.maxNuts - this.nutsEatn;;;
  }
}
```

## Additional hierarchy layer

As this makes the code protected from any disputes over its internal ownership, we can therefore call this subdirectory `safe`. The meaning of this subdirectory will be immediately clear, and all safety-minded users will therefore want to switch to it as soon as possible.

## XXX: what I'd have to do to finish this

I kind of need to understand Enterprise's already incredibly stupid name system. Not enough to understand its actual *function*, of course (what kind of enterprise architect bothers to understand an existing system's *function?*), but to understand what would have to change/be extended in the language to add this already horribly unnecessary and misplaced layer
