#!/bin/sh
python ./aquapured/json2cfg.py /data/options.json ./aquapured/release/aquapured.conf
cat ./aquapured/release/aquapured.conf
cd aquapured
./release/aquapured -d -c ./release/aquapured.conf
echo "Hi... you weren't meant to get here"
