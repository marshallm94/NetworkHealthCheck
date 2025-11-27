#!/bin/bash

while true
do
    # \047 = ASCII for single-quote, which is needed so the INSERT statement works
    PING_OUTPUT=$(ping -c 5 8.8.8.8 | jc --ping | awk '{print "\047" $0 "\047"}')
    psql --command 'INSERT INTO ping_log (output) VALUES ('$PING_OUTPUT');'
    sleep 60
done
