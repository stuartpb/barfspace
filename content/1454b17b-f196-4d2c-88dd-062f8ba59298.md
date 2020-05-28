# a way "internal domains" might be implemented in an out-of-the-box solution

ie. one where we can't introduce our own DNS server for DHCP (at least, not initially)

The service could use that RFC DDNS method to update records on an external domain name

Could even make that a synonym for ".internal" if the user chooses to hook up the "local DNS resolver" like what I'm setting up here - and then, once they've got that, they can disable the part that sets their internal addresses from a public-facing DNS endpoint

## The thing about "internal" versus this

While the "internal" names would work without a dependency on this live infrastructure (which is why I want to have it, just in case the whole endeavor goes a bit NextThingCo), they wouldn't support Let's Encrypt / ACME certificates.

So yeah, this overlaps that whole side of Ingress wrapping that needs consideration
