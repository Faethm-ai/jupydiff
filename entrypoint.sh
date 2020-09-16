#!/bin/bash
# generate diffs
git reset --soft HEAD^
for f in $(find . -name '*.ipynb' -print); 
do nbdime diff --no-color -s $f >> output.txt;
cat output.txt;
done
ls -lh

# write a comment to github
cd / && npm run
