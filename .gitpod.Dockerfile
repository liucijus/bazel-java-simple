# Build latest ubuntu with python and clang
FROM gitpod/workspace-full:2022-09-11-15-11-40

RUN sudo ln -s /home/gitpod/.sdkman/candidates/java/current/bin/java /usr/bin/java


# BAZELISK
RUN sudo curl -LO "https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64" \
     && sudo mv bazelisk-linux-amd64 /usr/bin/bazel \
     && sudo chmod +x /usr/bin/bazel

# # Pre-download multiple Bazel versions for efficiency 
RUN USE_BAZEL_VERSION=5.2.0 bazel version
