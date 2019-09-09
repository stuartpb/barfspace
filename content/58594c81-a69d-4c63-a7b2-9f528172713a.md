# Feathernet

Possible Quadration moonshot side-gig

## background

[this IEEE Spectrum article][1] really lays it out

[1]: https://spectrum.ieee.org/tech-talk/computing/networks/pigeonbased-feathernet-still-wingsdown-fastest-way-of-transferring-lots-of-data

[here](https://www.laetusinpraesens.org/musings/pigeon.php) is an article about how pigeons are a firewall-proof transport

and [here](https://cable.ayra.ch/pigeon/) is a calculator of bandwidth savings

## transport

HTTP/3 Over Avian Carriers

- Wow, okay, so you could use this to explain actual level-2 network routing or whatever
  - I mean it's also product fulfillment strategy for Amazon)
- where your destination (or maybe even your inital low-demand request) is communicated out-of-band
  - like on a different interface
    - and the low-bandwidth-needs stream could be on one interface
    - and the response streams are directed through another interface
      - (if the protocol supports this, or could be hacked to iptables its way to this)

you could also have transports like Dat or maybe IPFS and Secure Scuttlebutt

Shit, could this be useful for Hollywood?

but I could see this being an integral component layer for deep-caching layers, where posts live in RAM or local fast/SSD disk cache, but then the whole archives from everywhere are propagated out to all nodes

Wild thought: what about, like, magnetic ziplines? Probably too much work / overhead / infrastructure required


but yeah, this could be useful for Facebook-scale data operations: local nodes cache local content, and then the bulk of off-node content is transmitted between systems as a periodic dump to the other nodes via pigeon, where it is read from one microSD card via random access while another system uses a second copy to transcribe the data to long-term storage
