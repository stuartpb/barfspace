# A DNS server for local IP certificates

Originally came up with this for the [KDE Connect, But Without the KDE](grwyc-5hq76-4a8jw-gkhar-x9q8a) idea

## High concept

Local/internal services should have a way to authenticate themselves with a global name, and a certificate that is recognized from an established outside authority (ie. Let's Encrypt).

This is because it has a nice UX for users: they can be sure that they're connecting to the authorized server (because there's still a trust handshake between the server and the outside CA proving ownership of the domain), without having to introduce a whole

So basically, it's a roundabout way of using a DNS record as a key authority in a TLS-certificate-compatible way.

## The next level of idea

So, basically, you put a wildcard record on your DNS entry that points to a DNS server that will just return IP addresses specified in the requested name: what we're looking for is that the server we connect to can actually serve with the external-authority-provisioned certificate, proving that it has the trusted data that was recognized to generate the certificate.

## original rambling

Okay so, this is like how Plex does its local-server provisioning thing, but in a way that lets you point a domain name to a service and require no state - it's just a proxy for returning a wildcard certificate by responding to DNS-01 ACME challenges

https://blog.filippo.io/how-plex-is-doing-https-for-all-its-users/

https://forums.plex.tv/t/how-to-find-the-plex-direct-address/142539/5 might also have some insight

Okay so, your DNS record includes a TXT record describing the wildcard

You make your request to the host using a hostname like "api.base-of-wildcard-example.com" (where the wildcard record points to this server as the authoritative nameserver for this subdomain, so it always points to that server for this kind of domain), and it returns an A(AAA) record for the HTTP(S) side of this

actually you'd probably do it initially with a request to the known address, so it could provision the certificate on an already-secured connection

so yeah actually I guess the setup would mostly be in the form of HTTPS requests to a fixed endpoint to requisition the cert, which would trigger a DNS query within the request, using credentials supplied as a parameter

to prove ownership, you'd do some kind of handshake where you provide a signature for the request based on a key for this service that's specified in the DNS records. Or, maybe instead, you just have the signature of the valid Let's Encrypt credentials saved in a TXT record? I think that's safe?

Or, yeah, basically, I think you can have some kind of credentials-hash (like just "the credentials string that will be passed will have this SHA256 fingerprint") to protect access to the domain and authenticate certificate requests

Hell, actually, if you're allowed to use DNS-01 for all certs... this seems like it might be a somewhat nonintrusive way to do cert provisioning? if you don't feel like setting up an NGINX proxy or whatever... IDK

You could also have a plex.direct-like domain that has one level be a hash for credentials (or a hash for the hash of the credentials or something like that idk) as a way of just provisioning addresses in a fashion that makes it so you have to know the data to get the cert - the location is used as verification that the client has the same credentials (ie. that the server was able to secure the certificate for that location, because it had the credentials).

## related

xip.io does the wildcard-DNS thing
