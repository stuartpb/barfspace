# more mucking with the Firefox graphics stack

Continuing the changes I made [at the beginning of the month (August 2019)](7gdmn-90cj8-g7aqe-8jvf2-wfkge), having [improved my graphics stack about a week later](p5r97-82c7x-r0a9v-gva4b-7wngq)

Unsetting `layers.acceleration.force-enabled` and setting `gfx.webrender.enabled` to `true` instead

UPDATE: I was getting a lot of Firefox freezes and seeing the GPU get REALLY hot - not sure if this is all related, but I've decided to set `gfx.webrender.enabled` back to `false` for now. If the tearing becomes an issue again, I might try re-enabling it.

UPDATE 2019-09-03: the tearing was an issue again, so I've gone ahead and enabled *both* settings - that might have a different effect?
