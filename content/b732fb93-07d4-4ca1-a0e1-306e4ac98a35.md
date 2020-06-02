# the rise and fall of household-dns

I woke up to Tiare saying "the Internet is being really slow and spotty."

I pulled out my Chromebook, and none of the tabs I wanted open loaded.

Dreading what I was about to find out, I went into my network settings and threw the toggle for "Google DNS".

Everything started loading immediately.

Shit.

## a thought

oh, DNS doesn't round-robin, it just fails over if your DNS server seems really spotty, which our internal one did

## looking at the CoreDNS pod log

seeing a lot of errors like these:

```
[ERROR] plugin/errors: 2 www.google.com. A: tls: DialWithDialer timed out
```
Searching around for known issues, noticed this in https://coredns.io/explugins/forward/

> tls_servername NAME allows you to set a server name in the TLS configuration; for instance 9.9.9.9 needs this to be set to dns.quad9.net

so I'm gonna try removing the Quad9 server from the configmap and deleting (regenerating) the pod

## after reloading

Now I'm still getting a few "DialWithDialer timed out" errors, but also a lot of these:

```
[ERROR] plugin/errors: 2 marketplace.visualstudio.com. A: read tcp 10.42.2.8:38220->8.8.8.8:853: i/o timeout
[ERROR] plugin/errors: 2 marketplace.visualstudio.com. AAAA: read tcp 10.42.2.8:38222->8.8.8.8:853: i/o timeout
[ERROR] plugin/errors: 2 fonts.gstatic.com. A: read tcp 10.42.2.8:33218->1.1.1.1:853: i/o timeout
[ERROR] plugin/errors: 2 cdnjs.cloudflare.com. AAAA: read tcp 10.42.2.8:33238->1.1.1.1:853: i/o timeout
```

## punting

Can't help but conclude that, between my local available hardware resources and the state of DNS over TLS performance, this setup is simply not ready.

I might retry this some day with, like, a couple Raspberry Pis, but for now I'll just have to suffer through my ISP DNS

Turning off the record from DHCP. If I want to access internal names from a machine for now I'll set its DNS server explicitly

## other possible things to look into

- Prometheus?
- Is connection pooling implemented effectively?
  - https://github.com/coredns/coredns/issues/2733
    - I think they're thinking of `max_concurrent`?
      - [looks like it's unlimited by default though](https://github.com/coredns/coredns/issues/3635)
  - [this sounds like what I'm seeing](https://github.com/coredns/coredns/issues/2624#issuecomment-481322410)
    - hmm... is it because UDP lookups don't go through connection pooling somehow?
  - oh, [here's](https://github.com/coredns/coredns/issues/3521) an open issue that (from the title) sounds *just* like what we're seeing
    - it's just that it happens *way* sooner than 12 hours later for me
      - oh right, because the limits on the pod resource are way lower

## Why Fight This Fight

- I keep going in loops like "why would this fail if the router is able to proxy DNS just fine?"
 - and then it's like "oh right, the router isn't encrypting all requests"
- Maybe the problem is just putting all that TLS burden on CoreDNS?
  - This is where Prometheus would really help
  - Might make sense to just insert a dedicated dns encrypting proxy for CoreDNS to forward to

I don't want to run an internal-name-server if it means giving up encrypted name lookups

## another thought

that open GitHub issue notes that it takes a lot of memory... was stuff maybe failing because the DNS server was throttled per the limits we've set?

## my current plan

For the time being, the operating procedure / course of action is going to be to have systems manually opt in to household-dns (ie. disregard DHCP) if they want total encryption and/or access to `.internal`.

we're gonna wait and see if CoreDNS can figure out why their connection

## stuff I'm still trying

what if I change the configmap to say this:

```
        forward . tls://1.1.1.1 tls://1.0.0.1 tls://9.9.9.10 tls://149.112.112.10 tls://8.8.8.8 tls://8.8.4.4
```

also observing that the dashboard is showing a spike in the container that might coincide with when I saw errors. So maybe I just need to permit it more millicore, so reestablishing multiple connections at once doesn't hit a timeout?

ohhhhhhhhhh... tiiiiimeout

## tweet

https://twitter.com/stuartpb/status/1267582556616024065

- as this is a best-case analogy, I'm letting the hypothetical Chromebook parallelize the HTTPS handshakes, but not the CoreDNS instance.
  - also I have more faith in Chrome's ability to effectively parallelize TLS than Go
  - Oh, right, no, it's because I'm mapping the limits here to the full capability of the hypothetical machine

## abandoned reply

> Actually, now that I think about it, 100 millicore, which might be a suitable limit for the in-cluster "kube-dns" resolver (hence why it's the default in the CoreDNS Helm chart), is probably not enough to maintain a TLS-secured connection pool [(especially on this hardware)](https://twitter.com/stuartpb/status/1267582556616024065). I've increased the Deployment's limit to 1 core, and will see if I encounter any other problems.
>
> It's funny, you don't think of TLS handshakes as the kind of thing

I gave up writing this because, you know what, expanding the limit didn't help, I need to look into metrics

## adjustment

editing the Deployment to up the limit to 1 core, rather than .1 core (still leaving the request at .1 core)

reviewing the logs later... hmm, still seeing *some* failures. Not enough to completely crater things, though?

ugh, looking at node perf, I'm seeing 1.92 Core used at one of the timestamps... is this that freaking KubeApps thing?

## after several changes

this might have been a transient issue caused by the clock being out of sync?
