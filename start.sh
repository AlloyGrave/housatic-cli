#!/bin/bash

# Step 1: Start the HTTP server (this keeps the web server running in the background)
nohup python3 -m http.server 8000 > /dev/null 2>&1 &

# Step 2: Install dependencies (if you haven't already done it)
npm install

# Step 3: Start the bot in the background and handle menu navigation
nohup node . > output.log 2>&1 &

# Step 4: Use Node.js to automatically navigate the menu and press 'Enter' for each option
node -e "
const readline = require('readline');

// Assuming you're using a readline interface in the bot's menu
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Function to simulate pressing 'Enter' key for menu navigation
function pressEnter() {
  rl.write('\n');  // Sends an 'Enter' key press
}

// Function to automatically navigate the menu and select options
function navigateMenu() {
  // Step 1: Select 'Control a bot' by pressing 'Enter'
  pressEnter();  // Press 'Enter' to select 'Control a bot'

  // After selecting 'Control a bot', wait for the next prompt (which should be for bot selection)
  rl.once('line', (input) => {
    // Select the bot 'BlackArrow9O' (you may need to customize this based on actual bot name)
    rl.write('BlackArrow9O\n');  // Sends bot name selection

    // After selecting the bot, wait for the 'start' option to appear
    rl.once('line', (input) => {
      // Press 'Enter' to start the bot
      pressEnter();
      console.log('Bot started!');

      // Close the readline interface after bot has been started
      rl.close();
    });
  });
}

// Start the bot and navigate the menu automatically
function startBot() {
  // Start the bot process
  require('child_process').exec('nohup node . > output.log 2>&1 &', (err, stdout, stderr) => {
    if (err) {
      console.error('Error starting bot:', err);
      return;
    }
    console.log('Bot started!');
    navigateMenu();  // Begin the automated menu navigation
  });
}

// Start the bot with the automated menu selection
startBot();
"
