# frozen_string_literal: true

# Напишите функцию, которая при задании URL-адреса в виде строки анализирует только имя домена и возвращает его в виде
# строки. Например:
# * url = "http://github.com/carbonfive/raygun" -> domain name = "github"
# * url = "http://www.zombie-bites.com"         -> domain name = "zombie-bites"
# * url = "https://www.cnet.com"                -> domain name = cnet"

def domain_name(url)
  url = url.gsub('http://', '')
  url = url.gsub('https://', '')
  url = url.gsub('www.', '')
  url.split('.').first
end
