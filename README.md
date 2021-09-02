# RemoteConnectLabs
Script to remotely ssh into to all CS department labs.

The filesToCopy folder contains use cases of this script.

## How to Use
Run in terminal: `bash sshAll.sh [optional arguments: -c [file/folder to scp], -s [script to run]]`

- `-c` takes in the path of a file or folder to copy to the mathcsadmin home directory on all lab machines
- `-s` takes in the path of a script (from the perspective of the user mathcsadmin on a lab machine) to run on all lab machines as sudo. This script must already be on the machine. If it is not, then use the `-c` option to scp the script onto the machines.

### Example Useage
`bash sshAll.sh -c ~/RemoteConnectLabs/filesToCopy/UpdateAutomatorFix -s /Users/mathcsadmin/UpdateAutomatorFix/replaceFetchUpdates.sh`

This would take the UpdateAutomatorFix from the filesToCopy folder and scp it to the mathcsadmin home directory. Then, the script ssh's into the mathcsadmin home directory and runs the script replaceFetchUpdates.sh.
