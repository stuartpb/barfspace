# the server's clock is a mess

when I go to http://bob.prometheus.internal:9090/graph it says:

> Warning! Detected 100.45 seconds time difference between your browser and the server. Prometheus relies on accurate time and time drift might cause unexpected query results.

I noticed that my logs were three minutes into the future...

oh shit, could *that* be why things are "timing out"? omg lol

looking at [#94](https://github.com/rancher/k3os/issues/94) and [#381](https://github.com/rancher/k3os/issues/381) it looks like I'd want to add this to my config under `k3os` - like, if you don't set this up, nobody will?

```yaml
  ntp_servers:
  - 0.us.pool.ntp.org
  - 1.us.pool.ntp.org
```

yup, typing `sudo connmanctl` and `clock`:

```yaml
connmanctl> clock
  Time = 1591072581
  TimeUpdates = auto
  TimezoneUpdates = auto
  Timeservers = [  ]
```

`config ethernet_00e04c68000d_cable --timeservers 0.us.pool.ntp.org 1.us.pool.ntp.org`

okay now our clock is fixed
