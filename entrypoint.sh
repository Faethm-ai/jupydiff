#!/bin/bash

# generate diffs
# TODO: make sure this can find .ipynb in subdirectories
for f in *.ipynb; 
do nbdime diff --no-color -s $f >> output.txt;
done

# write a comment to github
npm run
