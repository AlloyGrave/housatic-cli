#!/bin/bash

npm install

nohup python3 -m http.server 8000 > /dev/null 2>&1 &

# Start the application
node . &

# Wait for it to initialize
sleep 5

# Log output to file
exec > >(tee -a /var/log/housatic.log) 2>&1

# Log a message indicating start
echo "Starting automated menu navigation..."

# Send keyboard input to navigate the menu
printf "\033[B\n"   # Move down to 'Create a bot'
sleep 2
echo "Moved down to 'Create a bot'"

printf "\n"         # Select 'Create a bot'
sleep 2
echo "Selected 'Create a bot'"

printf "BlackArrow\n" # Enter bot name
sleep 2
echo "Typed 'BlackArrow'"

printf "BlazeKnight\n" # Enter house owner's name
sleep 2
echo "Typed 'BlazeKnight'"

printf "3\n"         # Enter house slot
sleep 2
echo "Typed '3' for house slot"

# Control the bot
printf "\033[A\n"   # Move up to 'Control a bot'
sleep 2
echo "Moved up to 'Control a bot'"

printf "\n"         # Select 'Control a bot'
sleep 2
echo "Selected 'Control a bot'"

printf "1\n"        # Choose bot (assuming first option)
sleep 2
echo "Typed '1' for bot selection"

printf "start\n"    # Start the bot
sleep 2
echo "Typed 'start' to control the bot"
