#!/bin/bash
for f in *.ipynb; 
do nbdime diff --no-color -s $f >> output.txt;
done

PATH=$PATH:$HOME/.local/bin
rhino blairhudson/jupydiff/comment.js
