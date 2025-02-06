#!/bin/bash

# Start the application
node . &

# Wait for it to initialize
sleep 5

# Send keyboard input to navigate the menu
printf "\033[B\n"   # Move down to 'Create a bot'
sleep 1
printf "\n"         # Select 'Create a bot'
sleep 1
printf "BlackArrow\n" # Enter bot name
sleep 1
printf "BlazeKnight\n" # Enter house owner's name
sleep 1
printf "3\n"         # Enter house slot
sleep 1

# Control the bot
printf "\033[A\n"   # Move up to 'Control a bot'
sleep 1
printf "\n"         # Select 'Control a bot'
sleep 1
printf "1\n"        # Choose bot (assuming first option)
sleep 1
printf "start\n"    # Start the bot
