#!/bin/bash
for f in *.ipynb; 
do nbdime diff --no-color -s $f >> output.txt;
done

PATH=$PATH:/usr/local/lib/python3.7/site-packages
node /comment.js
