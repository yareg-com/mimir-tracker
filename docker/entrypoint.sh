#!/bin/sh
args=""

# Process PEER variables
i=1
while eval "[ -n \"\$PEER$i\" ]"; do
    eval "peer=\$PEER$i"
    args="$args -p $peer"
    i=$((i + 1))
done

# Process SERVER variables
i=1
while eval "[ -n \"\$SERVER$i\" ]"; do
    eval "server=\$SERVER$i"
    args="$args -s $server"
    i=$((i + 1))
done

# Add KEY if set
[ -n "$KEY" ] && args="$args -k $KEY"

exec mimir-tracker $args
