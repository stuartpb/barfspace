# invitation assembly checklist

- pick envelope
  - handle by edges!
- insert RSVP card
  - picture side facing side of envelope to be addressed
  - top to the left (ie. "RSVP" side faces up)
  - place RSVP-filled envelope on bed
- enter address into 3D Writer
  - see "3DWriter params" below for details
- write address to envelope
  - open 3D Writer gcode
  - ctrl+end, add M84
  - save to stuflair
  - run procedure

BREAK: LET DRY

after drying:

- remove RSVP card
  - inspect postcard side
- add number for RSVP card with UV ink
  - from spreadsheet
  - to right of "RSVP"
- add stamp to RSVP card
- re-insert RSVP card in original location
- insert invitation in front of RSVP card (from envelope flap side)
- add stamp to outer envelope
- seal
  - update spreadsheet

later:

- send
  - update spreadsheet

## 3DWriter params

- Bed: 250 x 210
- Pen offset: 43.5, -8
- Pen up: 6
- Pen down:
  - just RSVP card: 2.75 (2.5 engraves into postcard)
  - RSVP + invite: 3.5

Return address: scriptc 8mm, X 28, Y 75

Mail address: scriptc 16mm, Y 120 (X: no more than 50)

Salutation: scriptc 10mm, Y 115 (X: generally about 5 less than address)

### legacy

(parents ver: 12mm, 55x120)

## related notes

[pen plotting notes general](79mrz-rrwds-z98se-6a3yw-w984b)
