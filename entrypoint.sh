#!/bin/bash

# generate diffs
# TODO: make sure this can find .ipynb in subdirectories
for f in $(find . -name '*.ipynb' -print); 
do nbdime diff --no-color -s $f >> output.txt;
done
ls
# write a comment to github
npm run
