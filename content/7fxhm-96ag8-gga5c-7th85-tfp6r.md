# Stubernetes To-Do for 2020-05-24

- recreate household-ingress from Traefik template
  - install as Helm chart from repo?
- set up [code-server](1ya73-jmkrb-pd855-c48tg-rhem4)
  - this might entail making a pluskube version
- set up household-dns I guess?
  - maybe we fake this with a hosts file for a bit
  - doing this right entails:
    - setting up (to some degree) the pluskube helm chart repo
      - can be local, we just need to able to run helm on it
    - a new chart that sets up the coredns/external-dns/etcd thing ("ingress-dns")
      - doing this all in one pod, as dumb as it sounds, seems right for this use case
        - if it's not, we can figure that out some other day

the note server is the most critical part of all this, because my desktop note instance is getting increasingly clunky

## later

- set up address.exposed
- establish external-ingress
- set up some external-dns service

## also, at some point

[work on something better than k3s](r4598-4w62m-w29dv-rkvf4-cvdc4)
