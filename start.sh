#!/bin/bash
nohup python3 -m http.server 8000 > /dev/null 2>&1 &
npm install    # Install dependencies
node .         # Run the bot
