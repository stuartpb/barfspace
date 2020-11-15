# Labels from Linux

You've got your label printer running in Linux, but it's... awkward. You're still not sure how to reliably print on the entire width of a label.

- [ ] Try to work out why this printer's behavior is so weird.
  - [x] Dive into the driver scripts installed to /opt/brother by the AUR package.
  - [ ] Assess the CUPS / PPD UI to figure out how custom roll length can be implemented.
  - [ ] You're wasting a lot of your nice removable label paper. Swap the removable label paper for some plain white paper.
  - [ ] There seems to be a bug where paper size isn't getting set in some circumstances.
    - [ ] Build a repro procedure for triggering / working around the bug.
  - [ ] Figure out exactly where the paper size gets set in the process.
    - [x] Look at intermediate output files in /tmp.
    - [ ] It *looks like* the key player in this process is `rastertobrpt1`. Dive deeper.
      - [ ] Does nothing use `psconvertpt1`? Is it just a vestigial file from an earlier incarnation?
      - [ ] Determine if it produces similar output to `rastertobrpt1` and/or `filter_ql700`.
      - [ ] Look at the calling convention for `rastertobrpt1`.
        - [ ] Figure out what's provided on the command line. Is that how it gets the location of `paperinf`? (The only string references for "paperinf" are error messages, so it does use it, but it never names it internally.)
      - [ ] See what circumstances cause the driver to use something else.
      - [ ] See if you can figure out the "brpt1" output format.
      - [ ] Assess whether or not you can write your own replacement.
        - [ ] Find if there's documentation for this format.
        - [ ] Determine if it's as straightforward as, say, G-Code.
      - [ ] Understand the circumstances where paper size isn't set in the printer commands better.
- [ ] Write your own printing program that works just like you wanted it to in the first place.
  - [ ] Bring up the documentation for the printer's USB protocol.
- [ ] Buy a new, simpler printer.
