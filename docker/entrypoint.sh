#!/bin/bash

# generate diffs
nbdime diff --no-color -s HEAD^ HEAD >> output.txt

mv output.txt /

# write a comment to github
cd / && npm run start
ls -l
