#!/bin/bash
for f in *.ipynb; 
do nbdime diff --no-color -s $f >> output.txt;
cat output.txt;
done

PATH=$PATH:/usr/local/lib/python3.7/site-packages
echo $PATH
cd blairchudson
pwd
ls 
ls /var/lib/docker/
node ./comment.js
