#!/bin/bash
echo -e "\e[92mUploading file on the server...\e[0m"
cat $1 | while read line; do
put=$(curl -H "Referer: "$line"" -X PUT -T frogy.js -v $line &>/dev/null)
output=$(curl -s $line/frogy.js | grep "frogy_was_here")
if echo "$output" | grep -q "frogy_was_here"; then
        echo "$line is vulnerable to PUT method"
        echo "POC - $line/frogy.js"
        else
        :
fi
done
