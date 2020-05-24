#!/bin/bash
echo -n "" && top -l 1 -s 0| grep -E "^CPU" | awk -F ',' '{print $NF}'
