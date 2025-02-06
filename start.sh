#!/bin/bash

# Step 1: Start the HTTP server (keeps the process alive)
nohup python3 -m http.server 8000 > /dev/null 2>&1 &

# Step 2: Install dependencies
npm install

# Step 3: Start Housatic in the background
nohup node . > housatic.log 2>&1 &  

# Step 4: Wait for Housatic to start
sleep 5  

# Step 5: Select "Create a bot"
printf "\033[B\033[B\n" | node .  # Press "Down" twice, then Enter
sleep 2  

# Step 6: Type "BlackArrow" for bot name
echo -e "BlackArrow\n" | node .  
sleep 2  

# Step 7: Type "BlazeKnight" for house owner
echo -e "BlazeKnight\n" | node .  
sleep 2  

# Step 8: Type "3" for house slot
echo -e "3\n" | node .  
sleep 2  

# Step 9: Select "Control a bot"
printf "\033[A\n" | node .  # Press "Up" once, then Enter
sleep 2  

# Step 10: Select "BlackArrow" from the list
echo -e "1\n" | node .  # Assuming it's the first bot in the list
sleep 2  

# Step 11: Start the bot
echo -e "start\n" | node .  

# Keep script running to prevent shutdown
tail -f /dev/null
