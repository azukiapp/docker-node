#! /bin/bash

# - Show and exit on errors
set -e

# - clone shout
cd /tmp
rm -rf shout

echo "# clonning Shout"
git clone https://github.com/erming/shout.git

# - go to specific commit
echo "# $ git checkout 344e2560548372f8c2cbbe8d0d0b4538903fb50a"
cd shout
git checkout 344e2560548372f8c2cbbe8d0d0b4538903fb50a

# - provision
echo "# $ npm install"
npm install
npm install grunt-cli

echo "# $ npm run build"
npm run build

# - run in background
echo "# Starting shout"
cd /tmp/shout
node index.js --port 9999 &

# - wait for port
echo "# Waiting for the port 9999"
while ! nc -q 1 localhost 9999 </dev/null; do sleep 1; done

# - check
echo "# Check html output from http://localhost:9999"
curl -sSf localhost:9999 | grep "<title>Shout</title>"

# - terminate background job
# jobs; kill %1
echo "# Terminate server"
pkill node
