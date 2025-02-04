#!/bin/bash
nohup python3 -m http.server 8000 > /dev/null 2>&1 &
npm install    # Install dependencies
node .         # Run the bot
const readline = require('readline');

// Assuming you're using a readline interface in the bot's menu
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Function to simulate menu selection
function navigateMenu() {
  // Select "Control a bot" (assuming it's option 1)
  rl.write('1\n');  // Sends input '1' to choose the "Control a bot" option

  // After selecting "Control a bot", wait for the next prompt (which should be for bot selection)
  rl.once('line', (input) => {
    // Assuming the bot name is "BlackArrow9O"
    rl.write('BlackArrow9O\n');  // Sends the bot name to select it

    // After selecting the bot, wait for the "start" option to appear
    rl.once('line', (input) => {
      rl.write('start\n');  // Sends 'start' to initiate the bot
      console.log('Bot started!');
      
      // Once the bot starts, close the readline interface to finish the process
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
