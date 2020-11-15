# returning to the dashboard

logging in with the token via the proxy API is returning the same permission denied errors as before

tried deleting the ingress since, essentially, I've decided not to put an ingress on this, at least not for now

I might experiment with internal ingress sources later, but that'll be later

Well, fuck it, deleting the account and the rolebinding, recreating them, and getting the new token worked fine

(NOTE: this may have been an artifact of having renamed the node somehow? realized later that was a problem)

I'll keep the ingress for Kubeapps, though, because it seems like the authentication breaks when trying to log in through the proxy
