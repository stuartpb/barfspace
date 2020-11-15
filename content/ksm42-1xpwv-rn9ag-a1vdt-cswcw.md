# Studtop Mk 2 Plans/Exploration

TODO: fish still-relevant plans out from [the first iteration](kb2g7-vd6v4-039jt-yhx56-hhr8s)

## Already implemented

- [the Phase-2 Framework: Recovery-First](jwcha-677x6-mn9jr-k9pyv-3k7wv)
  - the recovery side is kind of crap, but I can work on it later if I care to
    - I'm kind of going to be looking into this anyway to bring Stuzzy back up
      - just bought a new 64GB MicroSD card and some USB drives to make a SuperPenguin, the many-in-one ISO booting stick

## Goals after this step

My first changes would all be in the service of reaching a remake of [the Iteration-1 Notestack Household Workspace](cy160-n7d4r-g681j-axcxz-6n35t)

Following procedures (with the benefit of hindsight) from [when I originally set this up on K3OS](kbryw-6dc19-r18n7-6pg5d-4aqwf)

- kubeapps
  - I'll see how close I can get to installing each of the rest of these as Helm charts
- metallb
- kubernetes-dashboard
- household-system/household-dns

[Following the Rebuilding Plan](5mj23-sjeyj-jqana-5xdyg-fg6gd)

## okay, so, what comes next, just after midnight 2020-06-13

here's the plan for my Saturday:

- Longhorn - I want to be able to set this next stuff up with storage available.
- Rebuild household-dns
- Maybe authentication soon, for the Dashboard in particular
  - Would also be useful for this next step with Grafana
- Prometheus Operator, Loki et al. Especially since I'm punting on metrics-server right now: I need to know if I'm making things cramped.
- then a notes workspace again

## Real future goals

- [I Should Have a Proper "Contacting" Page](c0fv1-mdhbq-6q813-9ps5n-axhzp)
- A Grafana / Today's Weather etc screen (a Hollywood Computer for cluster stats)
