Example project to reproduce Bazel project issues with Intellij IDEA remote projects

Install Bazel plugin. You can use a custom fork by [Wix](https://github.com/wix-playground/intellij/releases/tag/v20.0-NIGHTLY.849), which can import project by opening project from directory directly (official plugin only allows import via wizard which does not work on headless remote IDE).

Project has [Jetbrains Space](https://www.jetbrains.com/space/) configs and does not need project setup or configuration.
   
Quick start project view file for Bazel plugin (Bazel->Project->Open Project View File):
```
directories:
  .

targets:
  //...

derive_targets_from_directories: false

```
