#!/bin/bash

now=$(date)
domain=`awk -F/ '{print $3}' <<<"$1"`

if [ "$domain" = "codeforces.com" ]; then
    contest=`awk -F/ '{print $6}' <<<"$1"`
    ques=`awk -F/ '{print $7}' <<<"$1"`
    if [ -d "$PWD/codeforces/$2" ]; then
        cp "$PWD/template.cpp" "$PWD/codeforces/$2/$contest$ques.cpp"
    else
        mkdir -p $PWD/codeforces/$2
        cp "$PWD/template.cpp" "$PWD/codeforces/$2/$contest$ques.cpp"
    fi
    sed -i "1i /*\n *  Problem: $contest/$ques\n *  Date & Time: $now\n *  Url: $1\n */\\n" "$PWD/codeforces/$2/$contest$ques.cpp"
fi