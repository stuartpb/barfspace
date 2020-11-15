# rabbit path for reinstalling kubic 2020-06-17

Recursing from the notes of my first attempt at a Kubic install:

- [Installing Kubic on Studtop](apqev-my4ak-mzbtq-09rsa-dcac5)
- [Following the Rebuilding Plan](5mj23-sjeyj-jqana-5xdyg-fg6gd)
- [Rebuilding continues](c8x3g-xa5fx-jnb34-tx2tf-v2a13)
- [Preparing for OpenEBS](9z6e0-jbr2w-c296c-2a5vm-r0esy)
- [Retracing household-dns](82afk-fk2xc-rc954-gq524-me68y)
- [Actually installing OpenEBS](9jxgv-wgeyx-mra75-51wn3-gd604)
- [The Return of Prometheus](adfw5-f3v1p-wraf8-zkarh-k9vwq)
- [Trying to get OpenEBS Working](9p2xt-m51z4-abbqy-zxs5g-5x24d)

here is the path I plan on following:

- [x] install latest ISO to internal media
- reboot and reinstall
  - this time... yes, let's install LVM on the root
    - maybe this way we can even span over to a lerger drive via transactional-update at some point, in theory!
      - though I guess you can kind of do that anyway via plain old imaging and expansion?
        - but that's haaard
    - anyway
      - the perf impacts aren't meaningful
      - the compatibilty faults are not my responsibility
      - and it's one more thing to differentiate / potentially not cause this problem again
  - not setting the new hostname "studhood" unless it still wants to call it "studtop"
    - if so, fuck it, adding studhood to hostname
    - "hood" like "lid" because it's something you should only need to open in an emergency
      - or if you're a Fast and the Furious tinkerer
        - though even then you should be using the SSH key
          - this is all based on my latest model of what "the Ops-in-a-Box bundle" for this looks like
  - not doing an ignition script
    - I'll probably want one to run off the RPi4
  - installing deps
    - open-iscsi
    - e2fsprogs
  - reboot to apply update
  - can I install Weave from Helm?
    - let's say containers should still have this ASAP
    - also, not sure if Kubic's version is special
  - install of kubeapps

## actually...

Thinking about this a little more...

Using Kubeapps for the core system components has been a mistake. Not only is it bloated and inefficient (with a default update schedule that will bring a system to its knees), but it doesn't match the way I've effectively wanted to manage my configuration anyway ' Ive been copy-pasting config files in and out of theKubeapps interface and to a Git repository.

Looking at [Helm's charts documentation](https://helm.sh/docs/topics/charts/) now, I understand subcharts a little better, and I think it's time I started specifying my setup in a compatible way, as a chart of subcharts - or, better, as a collection of Argo applications versioned in Git.

I'm trying to figure out the cleanest way to have the system manage itself

I think I have my way forward now: [Chartifying the Stubernetes System Core](s1ge3-e429y-gjbpw-rbb2e-tk50q)

## related thoughts

- [Gibernetes](1ymee-cerd3-0nbgv-9chjh-n9ycj)
- [Better Kubernetes Iconography](an26z-0g916-jv8zm-4mthx-ds280)
- [A Better Scriptable Helm](14qpm-yzb8m-9nbrw-j3bcw-7wwg3)
