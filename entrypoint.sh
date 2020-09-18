#!/bin/bash

# generate diffs
cd pwd
 
nbdime diff --no-color -s HEAD^ HEAD >> output.txt
ls -lh
cat output.txt

# write a comment to github
npm run
cd /usr/local/lib/python3.8/site-packages/
node /comment.js
