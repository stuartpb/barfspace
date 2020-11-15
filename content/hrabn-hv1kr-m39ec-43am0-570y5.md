# de-wifying

Removing my wifi information from the base config file via `sudo mount -o remount,rw /k3os/system ; vi /k3os/system/config.yaml`

I could re-add it (as something like `/var/lib/rancher/k3os/config.d/wifi.yaml`), but, meh.

(doing `sudo mkdir -p /var/lib/rancher/k3os/config.d && sudo  mv /var/lib/rancher/k3os/config.yaml /var/lib/rancher/k3os/config.d/10_hostname.yaml` anyway tho)

I was originally going to keep the wifi online, because I was thinking "oh, two network interfaces on one device, that's simpler than two devices", but then I realized "oh wait, I don't need multiple network interfaces, I can have the device answer to a span of IP addresses, and if I resize my subnet mask I can allocate the laptop a whole block of IPv4s"

## Revisiting this in May

If I *did* want to re-enable Wi-Fi, I *would* do it by putting the network definition(s) with credentials in a separate YAML config file.

However, I'd also want to have it so that would only be a fallback if Ethernet were not available

https://01.org/connman/documentation describes a "PreferredTechnologies" key that would maybe allow that to be set up
