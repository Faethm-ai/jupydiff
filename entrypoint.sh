#!/bin/bash
# generate diffs
git rev-list --all --parents --max-count=1
for f in $(find . -name '*.ipynb' -print); 
do nbdime diff --no-color -s $f >> output.txt;
echo $f;
cat output.txt;
done
ls -lh

# write a comment to github
cd / && npm run
