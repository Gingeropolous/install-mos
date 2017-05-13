#!/bin/bash

cp $FILEDIR/$FILENAME $FILEDIR/$FILENAME.$now

new_line="\"user\": \"$MINE_ADD\","
new_ip="\"url\": \"stratum+tcp:\/\/$POOL_ADD:$POOL_PORT\","
sed -i "s/.*user.*/$new_line/g" $FILEDIR/$FILENAME
sed -i "s/.*url.*/$new_ip/g" $FILEDIR/$FILENAME

