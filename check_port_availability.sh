#!/bin/bash
set -x
PORT=8080
if lsof -i:$PORT >/dev/null; then 
	echo "PORT $PORT is in use."
else
	echo "PORT $PORT is free."
fi
