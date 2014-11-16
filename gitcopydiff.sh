#!/bin/bash
# Target directory
TARGET=$2
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

if [ -z "$1" ]
then
  echo "Commit ID and destiny directory are required";
  echo "Example: \"gitcopy HEAD ~/testing\"";
  exit 0;
fi
if [ -z "$2" ]
then
  TARGET="_updates";
  #echo "Destiny directory is required";
  #echo "Example: \"gitcopy HEAD ~/testing\"";
  #exit 0;
fi

echo "Copying to $TARGET"
for i in $(git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $1)
    do
        # First create the target directory, if it doesn't exist.
        sudo mkdir -p "$TARGET/$(dirname $i)"
        # Then copy over the file.
        echo "$i"
        sudo cp "$i" "$TARGET/$i"
    done
echo "Done";
