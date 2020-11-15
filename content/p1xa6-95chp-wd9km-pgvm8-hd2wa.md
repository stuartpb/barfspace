# .internal certification idea

- What if self-signed certificates had a special behavior in the `internal.` zone in browsers,
 - where instead of getting a yellow setup screen, you get a blue information screen telling you that you're going to a site that is on your local network, and not an outside site
  - (to prevent being a vector for localhost phishing attacks)
- is this dumb?
  - Is this just forgetting that you might as well have a page on .internal (or the recognized public internet) that prompts you to install the certificate for your own internal network?
    - And that could be on plain old HTTP to bootstrap it!
      - (though that's tecnically a security hole)

Reminder that there's a whole list of "internal TLDs" in Arch's systemd-resolved configuration, I think `resolvectl` lists them

## anyway

thinking about making a Secret in the cluster for certifying .internal, and maybe some certificates for the big subdomains I'm doing:

- workspaces.internal
- prometheus.internal
- stubernetes.internal
  - kubeapps might even move back under that

and then I'd just opt-in install it

of course this all dovetails into the Authentication Layer implementation, and if we want to use Household Ingress for anything

## see also

- [Let's Encrypt Internal Names](fhknf-d3whg-ysacs-0s3da-8tegm)
- [Delegating ACME?](2qzqb-1cedb-a9aqb-3sqnq-qvsmf)
