#!/usr/bin/expect

set timeout -1

# Step 1: Start the HTTP server (keeps the process alive)
spawn python3 -m http.server 8000

# Step 2: Install dependencies
spawn npm install
expect eof

# Step 3: Start Housatic
spawn node .
expect "◆  Main Menu"

# Step 4: Select "Create a bot"
send "\033[B"
send "\n"
expect "Enter bot name"

# Step 5: Enter bot name
send "BlackArrow\n"
expect "Enter house owner's name"

# Step 6: Enter house owner
send "BlazeKnight\n"
expect "Enter house slot"

# Step 7: Enter house slot
send "3\n"
expect "◆  Main Menu"

# Step 8: Select "Control a bot"
send "\033[A"
send "\n"
expect "Select bot"

# Step 9: Choose "BlackArrow" (assuming it's the first bot)
send "1\n"
expect "Bot commands"

# Step 10: Start the bot
send "start\n"
expect eof
