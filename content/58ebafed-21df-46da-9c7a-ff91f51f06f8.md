# rabbit path for reinstalling kubic 2020-06-17

Recursing from the notes of my first attempt at a Kubic install:

- [Installing Kubic on Studtop](55aeedd3-c454-4e9f-bd5c-09c654d62965.md)
- [Following the Rebuilding Plan](2d2421e6-4ef4-4a37-aaa8-bd6fa0f81a0d.md)
- [Rebuilding continues](623a3875-457f-4655-b193-5d169fb12823.md)
- [Preparing for OpenEBS](4fcce049-7817-4182-9330-4a2ee9803b1e.md)
- [Retracing household-dns](4094f9be-62eb-430c-9292-1728894718fe.md)
- [Actually installing OpenEBS](4cbb0df2-0ef7-4678-a394-a1e547069804.md)
- [The Return of Prometheus](535fc2bc-7b0d-4b98-a7a3-f3562334ef97.md)
- [Trying to get OpenEBS Working](4d85dd50-a1f9-414b-bbfb-fdc9605e888d.md)

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

I think I have my way forward now: [Chartifying the Stubernetes System Core](c860e1b8-824f-49f2-bb73-0b589da993f7.md)

## related thoughts

- [Gibernetes](0fa8e731-d868-4c15-b86d-2c8ca354f992.md)
- [Better Kubernetes Iconography](55446f82-0909-4a5b-8fd0-94d47adc8940.md)
- [A Better Scriptable Helm](092f6a7b-eb45-4135-bc72-435b387e7223.md)
