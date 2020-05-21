# aborted draft responding to a Tabalanche bug

Did you back up the folder before you dragged the other one on top of it? Tabalanche stores its data in Chrome's IndexedDB, which (last I checked) is stored as a LevelDB database, so if you dragged the folder over it, you will have reverted the database to whatever state it was in when you made the snapshot - and if you didn't save the previous folder state, that data is lost.

If you want to export your tabs for backup, you can click the "Export" link in the header, then copy and paste the