#!/bin/bash
cd .
# generate diffs
set -x
 


nbdime diff HEAD^ HEAD >> output.txt




ls -lh


# write a comment to github
cd / && npm run
