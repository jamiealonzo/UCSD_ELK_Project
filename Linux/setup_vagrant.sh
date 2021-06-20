#!/bin/bash

# Resolves last component of script path regardless of where it's being called
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd "$DIR"

# Assumed home directories
WIN_DIR="/c/Users/$(logname)/Documents/Cybersecurity-Bootcamp/Linux-Module"
MAC_DIR="/Users/$(logname)/Documents/Cybersecurity-Bootcamp/Linux-Module"

# Verify Vagrant installed properly
which vagrant > /dev/null 2>&1
if [[ "$?" -ne 0 ]]; then
  echo "Vagrant not installed! Please ensure Vagrant and VirtualBox are installed before running $0!"
  exit 1
fi