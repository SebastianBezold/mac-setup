# Initial setup of a new/fresh Mac

This repository contains scripts for a semi-automated setup of a fresh macOS installation.
After the installation the Mac will be setup with all the tools that I usually use for development purposes.


## How to run

The installation process can be run via:

```bash
/bin/bash ./setup.sh
```

In a bootstrapping step, commandline tools for XCode, the package manager [homebrew](https://brew.sh/) and [ansible](https://www.ansible.com) will be installed.
All additional tools and apps will be installed via `ansilbe`.

