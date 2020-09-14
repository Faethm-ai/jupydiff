#!/bin/bash
for f in *.ipynb; 
do nbdime diff --no-color -s $f >> output.txt;
cat output.txt;
done

PATH=$PATH:/root/.cache/pip/wheels/35/cf/c8/564c0e0472dda3a0d198b9031a05a84bcc1a4eadd9c3e3298a
/usr/local/lib/python3.7/site-packages/rhino
ls -l 
node blairhudson/jupydiff/comment.js
