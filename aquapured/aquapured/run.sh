#!/bin/sh
python ./aquapured/json2cfg.py ./data/options.json ./aquapured/release/aquapured.conf
./aquapured/release/aquapured -d -c ./aquapured/release/aquapured.conf
echo "Hi... you weren't meant to get here"
