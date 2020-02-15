#!/bin/bash
#sha256 workdir
find . -type f > content.txt
sort content.txt > content_sorted.txt
awk '{print "shasum -a 256 \""$0}' content_sorted.txt > temp.txt
awk '{print $0"\""}' temp.txt > get_sha.sh
chmod +x get_sha.sh
./get_sha.sh > content_shasum.txt
rm content.txt
rm content_sorted.txt
rm temp.txt
rm get_sha.sh
cat content_shasum.txt
