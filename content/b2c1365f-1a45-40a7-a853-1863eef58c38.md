# ssh ingress router. is this already a thing

user-based ingress / load balancer type proxy for ssh. so, like, I can't switch on hostname for ssh the way I do for http (though I guess the git-oriented design I'm thinking here could also be a hook triggered via a push via HTTP, which can be ingressed? Not sure how that / provisioning would work)

but so like yeah, you could have each project for a user have its own git server (or whatever ssh receiver - maybe the ssh service is even for port proxying), and so instead of `git@github.com:stuartpb/example.git` it's `example.stuartpb@fancy-ingress.example.org:dev.git` or something

that could even be your standard "service-name.namespace" automatic resolution there - you could let the username just straight up be the host to connect to as a cluster-local name

but then doesn't ssh already have proxy layers as a feature?

honestly though, an incoming-key-determines-the-user namespacing layer could be interesting. Combined with some DNS thing where the username-to-proxy-host mapping is distributed to different servers or whatever (like Cloudflare's system, but more like github.io)
