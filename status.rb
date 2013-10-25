#!/usr/bin/env ruby

require 'httparty'

SERVER = ENV['STATUS_SERVER'] || 'http://localhost:4567/'

def post_status(status)
  HTTParty.post(SERVER, {body: {status: status}})
end

if __FILE__ == $0
  post_status(ARGV.join(' '))
end
