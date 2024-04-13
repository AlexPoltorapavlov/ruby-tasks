# frozen_string_literal: true

# Для этой задачи нет тестов (сами все придумываете). Создайте утилитку, которая позволяет взаимодействовать с Bot API
#  Telegram
# Требование:
# - возможность подключения любого бота
# - возможность проверки обновлений
# - возможность регистрации, редактирования и удаления Webhook

require 'net/http'
require 'net/https'
require 'json'
require 'uri'

# TelegramBotUtility
class TelegramBotUtility
  BASE_URL = 'https://api.telegram.org/bot'

  def initialize(bot_token)
    @token = bot_token
  end

  def get_updates(offset = nil)
    api_request('getUpdates', { offset: offset })
  end

  def send_message(chat_id, text)
    api_request('sendMessage', { chat_id: chat_id, text: text })
  end

  def webhook=(url)
    api_request('setWebhook', { url: url })
  end

  def webhook_info
    api_request('getWebhookInfo')
  end

  def delete_webhook
    api_request('deleteWebhook')
  end

  private

  def api_request(method, params = {})
    uri = URI("#{BASE_URL}#{@token}/#{method}")
    uri.query = URI.encode_www_form(params) unless params.empty?

    response = Net::HTTP.get_response(uri)

    unless response.is_a?(Net::HTTPSuccess)
      raise "HTTP Request failed with code #{response.code} and message #{response.message}"
    end

    JSON.parse(response.body)
  end
end

# bot = TelegramBotUtility.new('BOT-TOKEN')
# begin
#   bot.delete_webhook
# rescue RuntimeError => e
#   puts "Webhook not found: #{e}"
# end
# updates = bot.get_updates
# chat_ids = updates['result'].map { |update| update['message']['chat']['id'] }
# bot.send_message(chat_ids[0], updates)
# bot.webhook = ('https://yourwebsite.com/your-endpoint')
# bot.send_message(chat_ids[0], bot.webhook_info.to_s)
