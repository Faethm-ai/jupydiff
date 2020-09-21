#!/bin/bash

# generate diffs
nbdime diff --no-color -s HEAD^ HEAD >> output.txt
#mv output.txt /usr/local/lib/python3.8/site-packages/

# write a comment to github
#npm run
node /comment.js
