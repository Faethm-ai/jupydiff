#!/bin/bash
for f in *.ipynb; 
do nbdime diff --no-color -s $f >> output.txt;
cat output.txt;
done

PATH=$PATH:/usr/local/lib/python3.7/site-packages
ls -l /usr/local/lib/python3.7/site-packages/rhino
rhino blairhudson/jupydiff/comment.js
