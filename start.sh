#!/bin/bash

# Step 1: Start the HTTP server (keeps the process alive)
nohup python3 -m http.server 8000 > /dev/null 2>&1 &

# Step 2: Install dependencies
npm install

# Step 3: Start Housatic in the background
nohup node . > housatic.log 2>&1 &  

# Step 4: Wait for Housatic to start
sleep 5  

# Step 5: Automate bot creation
echo -e "2\n" | node .  # Select "Create a bot"
sleep 2  
echo -e "BlackArrow\n" | node .  # Type bot name
sleep 2  
echo -e "BlazeKnight\n" | node .  # Type house owner
sleep 2  
echo -e "3\n" | node .  # Type house slot
sleep 2  

# Step 6: Select "Control a bot"
echo -e "1\n" | node .  
sleep 2  

# Step 7: Select "BlackArrow" from the list
echo -e "1\n" | node .  # Assuming it's the first bot in the list
sleep 2  

# Step 8: Start the bot
echo -e "start\n" | node .  

# Keep script running to prevent shutdown
tail -f /dev/null
