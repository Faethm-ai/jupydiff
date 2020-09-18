#!/bin/bash

# generate diffs
set -x
 
nbdime diff --no-color -s HEAD^ HEAD >> output.txt
ls -lh
cat output.txt

# write a comment to github
npm run
node $(find / -name 'comment.js' -print)
