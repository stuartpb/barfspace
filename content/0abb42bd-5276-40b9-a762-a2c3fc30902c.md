# more emulators on stushiba

I go ahead and `yay -S libretro`

also install mupen64plus because the invocation from libretro didn't have good controls

oof, looks like there's no on-board UI to configure the controller here

installing m64py from AUR

it crashes when trying to launch a game:

```
[stuart@stushiba ~]$ m64py
 __  __                         __   _  _   ____  _
|  \/  |_   _ _ __   ___ _ __  / /_ | || | |  _ \| |_   _ ___
| |\/| | | | | '_ \ / _ \ '_ \| '_ \| || |_| |_) | | | | / __|
| |  | | |_| | |_) |  __/ | | | (_) |__   _|  __/| | |_| \__ \
|_|  |_|\__,_| .__/ \___|_| |_|\___/   |_| |_|   |_|\__,_|___/
             |_|

M64Py - A frontend for Mupen64Plus version 0.2.4

Frontend: INFO: No OpenGL_accelerate module loaded: No module named 'OpenGL_accelerate'
Frontend: INFO: attached to library 'Mupen64Plus Core' version 2.5.0
Frontend: INFO: includes support for Dynamic Recompiler.
Frontend: INFO: video extension enabled
Unhandled Python exception
Aborted (core dumped)
```
