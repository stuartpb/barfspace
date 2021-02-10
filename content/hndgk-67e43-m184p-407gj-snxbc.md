# Understanding stty

from https://man7.org/linux/man-pages/man1/stty.1.html

some of this is better understood when conferring with https://man7.org/linux/man-pages/man3/termios.3.html

## breaking down raw

on `stty raw`:

> same as -ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr
> -igncr -icrnl -ixon -ixoff -icanon -opost -isig -iuclc -ixany
> -imaxbel -xcase min 1 time 0

This disables not only superfeatures, but all subfeatures as well (ie. behaviors that depend on parity checking) The point of this is to set the terminal to a baseline where as few modifications to the input stream are made as possible, so that you can them all on one-by-one as needed:

- do not ignore break characters (`-ignbrk`)
  - do not read them as interrupts (`-brkint`)
- some options involving the high / parity bit:
  - do not check input for parity (`-inpck`)
  - do not ignore parity errors (`-ignpar`)
  - do not mark characters exhibiting parity errors (`-parmrk`)
    - per termios docs: "This bit is meaningful only when INPCK is set and IGNPAR is not set"
  - it sounds like "parity errors" here is defined as "all characters above 127"
    - I don't think the terminal realistically receives parity-encoded data in the 01 quidera
  - do not clear the high (eighth) bit of input characters (`-istrip`)
- some options involving carriage return:
  - do not translate newline to carriage return (`-inlcr`)
  - do not ignore carriage return (`-igncr`)
  - do not translate carriage return to newline (`-icrnl`)
- a couple options involving flow control:
  - disable XON/XOFF (CTRL+Q / CTRL+S) flow control for output (`-ixon`)
  - disable XON/XOFF (CTRL+Q / CTRL+S) flow control for input (`-ixoff`)

This is why `-raw` is defined as `cooked` rather than a strong inversion of `raw`:

> same as brkint ignpar istrip icrnl ixon opost isig icanon, eof
> and eol characters to their default values

Meaning:

- do read break characters as interrupts (`brikint`)
- ignore parity errors (`ignpar`)
  - still depends on the setting of `inpck`
- clear bit 
  - if you're putting in UTF-8, you probably don't want this

## breaking down sane

> same as cread -ignbrk brkint -inlcr -igncr icrnl icanon iexten
> echo echoe echok -echonl -noflsh -ixoff -iutf8 -iuclc -ixany
> imaxbel -xcase -olcuc -ocrnl opost -ofill onlcr -onocr -onlret
> nl0 cr0 tab0 bs0 vt0 ff0 isig -tostop -ofdel -echoprt echoctl
> echoke -extproc -flusho, all special characters to their
> default values
