#!/bin/bash

# exit on error
set -e
# print commands
set -x

bazel build //...

# TODO: find out why Bazel plugin hangs importing project if prefecth is enabled?
echo "prefetch.on.vcs.sync=false" >> ~/.intellij-experiments
echo "prefetch.on.project.open2=false" >> ~/.intellij-experiments

# install Scala plugin
/mnt/space/system/ide/bin/remote-dev-server.sh installPlugins /mnt/space/work/bazel-java-simple org.intellij.scala

# install customized Bazel plugin by copying over to plugins directory
# make sure plugin build matches Intellij version
# https://github.com/wix-playground/intellij/releases for other versions
PROJECT_ROOT=/root/.config/JetBrains/RemoteDev-IU/_mnt_space_work_bazel-java-simple
mkdir -p ${PROJECT_ROOT}/plugins
wget https://github.com/wix-playground/intellij/releases/download/v20.0-NIGHTLY.848/bazel-intellij-20221.20-NIGHTLY.848.zip -O /mnt/space/work/ijwb.zip
unzip -o /mnt/space/work/ijwb.zip -d ${PROJECT_ROOT}/plugins
