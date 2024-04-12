# frozen_string_literal: true

# Для этой задачи нет тестов (сами все придумываете). Создайте утилитку, которая позволяет взаимодействовать с Bot API Telegram
# Требование:
# - возможность подключения любого бота
# - возможность проверки обновлений
# - возможность регистрации, редактирования и удаления Webhook

require 'net/http'
require 'json'
require 'uri'

# TelegramBotUtility
class TelegramBotUtility
  BASE_URL = 'https://api.telegram.org/bot'

  def initialize(bot_token)
    @token = bot_token
  end

  def get_updates(offset = nil)
    method = 'getUpdates'
    uri = URI("#{BASE_URL}#{@token}/#{method}")

    params = {
      offset: offset
    }

    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end

  def send_message(chat_id, text)
    method = 'sendMessage'
    uri = URI("#{BASE_URL}#{@token}/#{method}")

    params = {
      chat_id: chat_id,
      text: text
    }

    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end

  def set_webhook(url)
    method = 'setWebhook'
    uri = URI("#{BASE_URL}#{@token}/#{method}")

    params = {
      url: url
    }

    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end

  def get_webhook_info
    method = 'getWebhookInfo'
    uri = URI("#{BASE_URL}#{@token}/#{method}")

    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end

  def delete_webhook
    method = 'deleteWebhook'
    uri = URI("#{BASE_URL}#{@token}/#{method}")

    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end
end

# bot = TelegramBotUtility.new('BOT_TOKEN')
# bot.delete_webhook
# puts bot.get_updates
# bot.send_message('chat_id', bot.get_updates)
# bot.set_webhook('https://yourwebsite.com/your-endpoint')
# bot.send_message('chat_id', bot.get_webhook_info)
