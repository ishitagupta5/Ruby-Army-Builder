#!/bin/bash

for i in {0..5}
do
    ruby main.rb "input-$i.txt" "o.txt"
    diff "output-$i.txt" "o.txt" 
    if [ $? -eq 0 ]; then
        echo "output-$i matches"
    else
        echo "output-$i mismatch"
    fi     
done