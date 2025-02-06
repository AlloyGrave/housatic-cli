#!/bin/bash

# Step 1: Start the HTTP server (keeps the process alive)
nohup python3 -m http.server 8000 > /dev/null 2>&1 &

# Step 2: Install dependencies
npm install

# Step 3: Start Housatic in the background
nohup node . > housatic.log 2>&1 &  

# Step 4: Wait for Housatic to start
sleep 3  

# Step 5: Automate bot creation
echo -e "2\nBlackArrow\nBlazeKnight\n3\n" | node .  

# Step 6: Select "Control a bot"
sleep 1  
echo -e "1\nBlackArrow\n" | node .  

# Step 7: Start the bot
sleep 1  
echo -e "start\n" | node .  

# Keep script running to prevent shutdown
tail -f /dev/null

