#!/bin/bash
echo -n " " && uptime | awk -F 'up ' '{print $2}' | awk -F ',' '{print $1}'
