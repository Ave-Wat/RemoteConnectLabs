# RemoteConnectLabs
Script to remotely ssh into to all CS department labs.

## How to Use
Run in terminal: `bash sshAll.sh [optional arguments: -c [file/folder to scp], -s [script to run]]`

- `-c` takes in a file or folder to copy to all lab machines
- `-s` takes in the name of a script to run on all lab machines as sudo. This script must already be on the machine. If it is not, then use the `-c` option to scp the script onto the machines.
