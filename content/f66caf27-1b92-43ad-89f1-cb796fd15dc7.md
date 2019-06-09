# about petlogs

## What are "pet" systems?

A "pet" system is any live system that you maintain directly, instead of instantiating as needed via reproducible builds (ie containers or NixOS). It's a nostalgic approach that most sysadmins still haven't realized is a pointless waste of time.

## What are petlogs?

Petlogs are journals of every change that's made to the running system, and *why* that change was made.

## Why keep petlogs?

Sure, you *could* just `less ~/.bash_history`, but that doesn't tell you:

- how a command was arrived upon or what documentation recommended it
- why the command was run / what it was trying to do
- what happened when the command was run
- things that happened on other accounts / shells (or GUI configuration)
- what was typed in a nano/vim/visudo session

Moreover, *no* forensically-derived analysis of a system's history is going to be of any use if the system has wedged itself into a state where such forensics would be inaccessible, ie. if you ran a command that corrupted your superblock.

For this reason, petlogs are always kept on a reliable system *outside of* the one being journaled, ie. in the cloud.

## Why keep a single repository?

I originally maintained each of these logs in separate Gists; however, having them all in one repository makes it easier to cross-reference approaches that were used in other systems when taking the same actions on another one, and also makes it easier to keep all the logs, for reference, in the same sort of layout (ie. adding frontmatter to all the logs at once in one commit).

## Style Guide

Present tense is used when things are documented shortly before, after, or during the thing being described: if something isn't being written about within about thirty seconds of when what's being described is happening, it'll generally be described in the past, or future, tense.

## Metadata format

The `metadata.yaml` files for each machine contain some characteristic information about that system:

- `hostname` or `nickname` define the name of the machine. If the machine's hostname is not explicitly controllable (eg. Android phones and ChromeOS devices), this will use `nickname`; otherwise, it will use `hostname`.
- `machine-id`: The content of [/etc/machine-id](https://www.freedesktop.org/software/systemd/man/machine-id.html) for the system, if present.
- `distro`: What operating system was loaded onto the machine. Known values (self-explanatory):
  - `archlinux`
  - `android`
  - `raspbian`
  - `win10`
- `processor`: What processor architecture the device uses (in practice, either `x64` or `arm`).
- `chassis`: What the machine's form-factor is, using the same values as the "CHASSIS" parameter of [/etc/machine-info](https://www.freedesktop.org/software/systemd/man/machine-info.html). The "convertible" value is used here to refer to systems that live on removable storage that is passed from device to device (eg. a bootable flash drive).
- `tags`: An array of keywords that describe other commonalities between systems not expressible within the structure described above. Currently, the only tag in use is "chromebook", denoting a Chromebook that has had its onboard storage overwritten with a pet OS.
