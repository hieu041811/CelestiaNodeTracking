# Telegram Node Uptime Bot

This is a simple Telegram bot that retrieves and displays uptime information for Celestia nodes. It listens for messages containing Celestia node IDs, and then queries the Celestia Leaderboard API to retrieve information about the node's uptime, type, total synced headers, and other relevant data. The bot then formats this information into a human-readable message and sends it back to the user who requested it.

## Installation

To use this bot, you'll need to have Ruby and the bundler gem installed on your system. Once you have those installed, follow these steps:

1. Clone this repository to your local machine.
2. Install the required gems by running bundle install in your terminal.
3. Copy the .env.example file to .env, and add your Telegram bot token to the TELEGRAM_BOT_TOKEN variable.
4. Run the bot by running ruby telegram_bot.rb in your terminal.

## Usage

To use the bot, simply send a message to it containing a Celestia node ID. The bot will then retrieve information about the node's uptime and other data, and send it back to you in a formatted message.

## Usage

To use the bot, simply add it to a group chat and start a message with the nodeID. Once you enter a valid node ID, the bot will send a message with the uptime and information for the specified node ID.

## Contributing

Contributions are welcome! To contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes and commit them with a descriptive message.
4. Push your changes to your fork.
5. Submit a pull request to the main repository.

## License

This project is licensed under the MIT License.
