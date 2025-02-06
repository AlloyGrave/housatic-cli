#!/bin/bash

# Step 1: Start the HTTP server (this keeps the web server running in the background)
nohup python3 -m http.server 8000 > /dev/null 2>&1 &

# Step 2: Install dependencies (if you haven't already done it)
npm install

node .
