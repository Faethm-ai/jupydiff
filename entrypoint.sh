#!/bin/bash
# generate diffs
git reset --soft HEAD@{1};
for f in $(find / -name '*.ipynb' -print); 
do nbdime diff --no-color -s $f >> output.txt;
nbdime diff --no-color -s $f
echo $f;
cat output.txt;
done
ls -lh

# write a comment to github
cd / && npm run
