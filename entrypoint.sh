#!/bin/bash

# generate diffs
# TODO: make sure this can find .ipynb in subdirectories
git reset --soft HEAD~1
for f in $(find . -name '*.ipynb' -print); 
do echo $f; nbdime diff --no-color -s $f >> output.txt;
done
ls -l
# write a comment to github
cd / && npm run
