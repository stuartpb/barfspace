# Build systems

- [Ninja](https://ninja-build.org/manual.html) seems like the most sensible way to set up a native project these days
  - Or rather, [Meson](https://mesonbuild.com/) using Ninja as a backend
- What about [Bazel](https://bazel.build/)?
  - I think that's maybe a higher-level construct?
  - But it does reproducible builds?
  - It can go as high level as [Docker images](https://github.com/bazelbuild/rules_docker)
