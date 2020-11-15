# location problems

The system clock thinks I'm still on the East Coast. I could change it manually, but I want autolocation to work.

Googling around about Mozilla Location Services (mentioned in the GNOME settings for this) suggests an issue with the API being rate limited [(it's patents' fault)](https://blog.mozilla.org/services/2019/09/03/a-new-policy-for-mozilla-location-service/). `systemctl status geoclue.service` is showing `Failed to query location: Forbidden` errors (per [the advice from this wiki page about Redshift](https://wiki.archlinux.org/index.php/redshift#Automatic_location_based_on_GeoClue2))

Related reports from months ago:

- https://unix.stackexchange.com/questions/495333/geoclue2-insists-that-permission-is-forbidden
- https://gitlab.freedesktop.org/geoclue/geoclue/issues/101
- https://bugs.archlinux.org/task/61494
- https://bugs.launchpad.net/ubuntu/+source/geoclue-2.0/+bug/1826290
- https://gitlab.gnome.org/Teams/Board/issues/97

Tweaked `YOUR_KEY` in /etc/geoglue/geoclue.conf as recommended in a few of those:

```
# URL to the wifi geolocation service. If not set, defaults to Mozilla's
# Location Service with a hardcoded key. To use a custom key, uncomment this URL
# while changing YOUR_KEY to your MLS API key.
url=https://location.services.mozilla.com/v1/geolocate?key=geoclue
```

After getting `Failed to query location: Bad Request` (because I'd typed "geocode" instead of "geoclue") and finxing that, it's working: I jiggled it by clicking the notification for the last time it set the location to EST, then turning automatic time zone off and back on again.
