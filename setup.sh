#!/bin/bash


# Installs OSX commandline tools without interactive UIs (like xcode-select --install would do)
# Credits to:
# - https://apple.stackexchange.com/a/195963
# - https://github.com/why-jay/osx-init/blob/master/install.sh
# - https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh

install_osx_commandline_tools () {
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate --list |
    grep "\*.*Command Line" |
    head -n 1 |
    sed -e 's/^* Label: //' |
    tr -d '\n')
  softwareupdate -i "$PROD" --verbose
  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
}

echo "Installing CommandLineTools for XCode"
if ! xcode-select -p >/dev/null; then
  echo "XCode commandline tools not installed. Installing"
  install_osx_commandline_tools
else
  echo "Already installed. Skipping"
fi


echo "Installing homebrew"
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Already installed. Skipping"
fi

echo "Installing ansible"
if ! command -v ansible >/dev/null; then
  brew install ansible
else
  echo "Already installed. Skipping"
fi

echo "Running ansible playbook for further installations"
ansible-playbook playbook.yml -i hosts -v

