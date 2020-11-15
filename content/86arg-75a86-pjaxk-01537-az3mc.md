# installing numpy on octopi on an rpi0w

sshing in to the `pi` user

per https://github.com/jneilliii/OctoPrint-BedLevelVisualizer/issues/141#issuecomment-542227338

```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

going back to the web UI and reinstalling bed visualizer

didn't see it complete (I believe I Tabalanched the tab with the installer dialogue), but it was in the menu  after, and the server needed a restart

logged back into SSH:

```bash
sudo swapoff -v /swapfile
sudo rm /swapfile
```

setting `G81` as the gcode for bed data in the wizard
