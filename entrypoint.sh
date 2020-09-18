#!/bin/bash
cd .
# generate diffs
git reset --soft HEAD@{1};
for f in $(find . -name '*.ipynb' -print); 
do nbdiff --no-color -s $f >> output.txt;
nbdiff --no-color -s $f
echo $f;
cat output.txt;
done
ls -lh

# write a comment to github
cd / && npm run
