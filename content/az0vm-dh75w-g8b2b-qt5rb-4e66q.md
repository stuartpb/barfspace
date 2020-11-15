# Gearing Up for a Real Cluster

This was the first iteration of Stubernetes to span a machine beyond the Chromebook, when I realized trying to run everything off of 2 cores was going to be somewhat tricky.

## anyway here we go again

- [Preliminary Notes](gmx7p-kwtwa-mr9hk-0ksq0-r3kwv)
  - original plan outline
    - note that divergences started fairly quickly in the deployment process
  - Includes rationale for using Rook (and not OpenEBS)
    - OpenEBS's CPU needs having been the point of failure for the previous revision was part of the rationale
      - Ceph may not necessarily end up being any better, but we'll see, and putting it on a Pi means we'll be ready
    - not needing iscsid running on the host is another big one
      - Rook just seems better-suited in general, especially on Kubic
- [2020-07-02 studtop initial setup](2fpzv-ssxwf-6e83n-vccmf-4mpd0)
- [setting up the Raspberry Pi 4](h0xas-0hxsj-rbamd-7qedf-y6jre)
- [what success looks like](pbkkf-jbs3t-cf9qt-nbc92-1gv0q)
- [Initial Stubernetes setup](qcptj-gdnfj-g2a7q-29gbv-66s09)
  - wipefs on devices
  - labeling nodes for Ceph
  - rolling out Helm Operator
- [The next wave](b13jy-1nwxy-gj9z2-1jmw5-qawr2)
  - rolling out metallb successfully
  - needed to move the helm operator to the x64 node
  - this was when I untainted studtop for assignment
    - and when I realized the next iteration would want a Pi for the master node
  - got household-dns running
    - needed to fix some problem in my yaml
- somewhere around here I rolled out [Stuplink](84772-8as0e-0v96g-ah4v3-jsbk0)
- [A Screeching Halt](394x5-5xy60-7q9ry-9d4n4-cx1re)
  - everything fails at once
  - I resolve to come back to this project again in a month after there's been another release cycle or two
