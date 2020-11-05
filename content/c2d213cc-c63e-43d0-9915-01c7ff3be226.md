# Automatic Updates in Ska Linux

This is another thing that runs on the host, and as such should be managed by systemd: however, there might as well be a daemon that manages the Service file(s)

I guess that'd be the part that would handle the trigger file (it adds it as a PostExec to the service?)
