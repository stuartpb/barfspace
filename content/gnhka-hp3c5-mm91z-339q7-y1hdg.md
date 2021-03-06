# 2019-06-13 on stutendo

I've been having issues with my Toshiba FlashAir (more details [here](q07bd-zv0n7-wg9dq-stxje-88h2q)).

I logged in and got to work on [switching to Firefox](fc7r5-6kzqt-4p9pq-c1jvg-vs8m4).

I had to reinstall it because it had Nightly as an option for default browser, but not Firefox (a known issue.)

It opened with about:newinstall open, telling me that Firefox installs don't share as much as they used to (good - this is probably how Nightly became a defaut-browser candidate and Firefox wasn't).

I still can't add it as a mailto: target, even after reinstalling, so I'm following Qunedinator's advice from here: https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings/how-to-set-firefox-gmail-as-windows-default/296816f4-e2d7-48dd-ae71-84d18a02dc18

(aside: https://techdows.com/2018/10/set-firefox-as-default-mail-client-in-windows-10.html highlighted https://bugzilla.mozilla.org/show_bug.cgi?id=675428, but that was backed out due to https://bugzilla.mozilla.org/show_bug.cgi?id=1496380 - I've complained summarily)

Going to HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\ (aside: god *damn* but Windows has some terrible namespacing in its registry) shows the roots of this issue - I have 3 installations for Firefox listed, one as "FIREFOX.EXE", one as Firefox-308046B0AF4A39CB, and one as Firefox-E7CF176E110C211B (looking at the "InstallInfo" paths, these appear to be Nightly, the 64-bit version of Stable, and the 32-bit version of Stable, respectively).

Not sure what the deal is with the x86 installation (my currently-running one is definitely 64-bit), and I'm probably going to remove the Nightly installation (maybe I'll bring it back at some sorry point in the future where I'm regularly booted into Windows again), but I've added a "mailto" key with the same value as the others to HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Firefox-308046B0AF4A39CB\Capabilities\URLAssociations
