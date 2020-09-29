#!/bin/bash

# generate diffs
nbdime diff --no-color -s HEAD^ HEAD >> output.txt

# move output.txt to root so npm can find it
mv output.txt /

# write a comment to github (run comment.js)
cd / && npm run start
