#!/bin/bash
# generate diffs
for f in $(find . -name '*.ipynb' -print); 
do nbdime diff --no-color -s $f >> output.txt;
done
ls -lh

# write a comment to github
cd / && npm run
