# Notes on Pomerium Operator and Contour

So, the dream would be to be able to have annotations in our Helm chart that make the ingress Just work with authentication. However, that doesn't seem especially likely.

I ended up just [Moving to ingress-nginx](8hs34-qrjyd-04a0f-ms2cp-y214p)

## Contour issues

- [extremely long explainer on external auth background / goals](https://github.com/projectcontour/contour/issues/2459)
- [a few other ingress auth headers](https://github.com/projectcontour/contour/issues/68)

## unrelated issues?

- [Provide support for integrating with external auth for TCP connections](https://github.com/projectcontour/contour/issues/2888)
- [Expose Envoy's network rbac filter configuration in contour](https://github.com/projectcontour/contour/issues/2971)
