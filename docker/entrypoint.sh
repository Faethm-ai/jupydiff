#!/bin/bash

# generate diffs
nbdime diff --no-color -s HEAD^ HEAD >> output.txt

# write a comment to github
cd / && npm run start
