# keyboard lamp faceplate design

so, you'd have this little popout on the left, between Escape and Q (maybe button height, if space is needed, though flush would be cooler)

the pivot point is above the escape key, on the side of the case

it's wired to a circuit attached via pogo pins to the top (if there aren't power leads that could be tapped on the front), which goes through a dim-enough resistor to an SMD 2020 or so LED

It's switched on by being snapped into position, like on my old Kindle's case - rotating and snapping into place makes the copper-tape connection

of course, there's also the idea of printing the case translucent / glow-in-the-dark, and letting the LED be inside the case. in any case, we're still tapping a power connection and routing it to an SMD LED via a switch. and only this one lets it keep the neat opaque yellow plastic that feels like a game boy

## possible simpler lamp

What if I just made a hole to the part at the bottom of the screen where you can see the backlight LED through the case, and put a little periscope mirror assembly so it shines on the keyboard while open?

ohh snap, I'm realizing my bezel covers it up: did the clear bezel let it shine through? is this not a problem the bare chip has, because that light actually *is* meant for keyboard illumination?

this is another circuit that could be incorporated: a WS2812 string, or just LED string, that illuminates the inside of a translucent case.

heck, add a buzzer component and you've made yourself a fancy-ass pager
