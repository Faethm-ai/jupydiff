#!/bin/bash
for f in *.ipynb; 
do nbdime diff --no-color -s $f >> output.txt;
done

$rhino blairhudson/jupydiff/comment.js
