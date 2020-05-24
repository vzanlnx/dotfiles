#!/bin/bash
echo -n " " && uptime | awk -F ':' '{print $NF}' | sed 's/,/./g' | awk '{print $1,"|",$2,"|",$3}'
