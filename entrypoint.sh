#!/bin/bash
cd .
# generate diffs
set -x
 
nbdime diff --no-color -s HEAD^ HEAD >> output.txt
ls -lh
cat output.txt

# write a comment to github
cd / && npm run
