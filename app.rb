require 'telegram/bot'
require 'net/http'
require 'json'
require 'date'
require 'dotenv'
Dotenv.load

telegram_token = ENV['TELEGRAM_BOT_TOKEN']
Telegram::Bot::Client.run(telegram_token) do |bot|
  bot.listen do |message|
    if message.is_a?(Telegram::Bot::Types::Message) && message.text
      chat_id = message.chat.id
      node_id = message.text

      if node_id.include?('12D3') && node_id.length == 52
        begin
          uri = URI("https://leaderboard.celestia.tools/api/v1/nodes/#{node_id}")
          res = Net::HTTP.get_response(uri)
          data = JSON.parse(res.body)
          puts "data: #{data}"
          node_id = data['node_id']
          uptime = data['uptime']
          type = data['node_type_str']
          total_synced_headers = data['total_synced_headers']
          node_runtime_counter_in_seconds = data['node_runtime_counter_in_seconds']
          network_height = data['network_height']
          last_restart = data['last_restart_time']
          icon = uptime >= 80 ? "🟢" : uptime >= 40 ? "🟡" : "🔴"

          # message = "🚀 Node ID: #{node_id}\n\n#{icon} Uptime: #{uptime}\n\n💡 Type: #{type}\n\n💎 Total Sync Headers: #{total_synced_headers}\n\n⏰ Node runtime counter in seconds: #{node_runtime_counter_in_seconds}\n\n📈 Network height: #{network_height}\n\n🕑 Last Restart: #{DateTime.parse(last_restart).strftime('%d/%m/%Y %H:%M:%S')}"
          message = "🌐 Celestia Node Tracking 🌐

🖥 Node: #{node_id}

🔧 Node type: #{type}

#{icon} uptime percentage: #{uptime}%

🧱 Total Sync Headers: #{total_synced_headers}

🔋 Node runtime counter in seconds: #{node_runtime_counter_in_seconds}

💪 Network height: #{network_height}

📆 Last Restart: #{DateTime.parse(last_restart).strftime('%d/%m/%Y %H:%M:%S')}
          
💎 Keep up the great work! 🎉"

          bot.api.send_message(chat_id: chat_id, text: message)
        rescue => error
          puts "Error: #{error}"

          bot.api.send_message(chat_id: chat_id, text: 'Sorry, there was an error retrieving data for that wallet.')
        end
      end
    end
  end
end
