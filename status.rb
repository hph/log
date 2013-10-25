#!/usr/bin/env ruby

require 'httparty'

def post_status(status, server='http://localhost:4567/')
  HTTParty.post(server, {body: {status: status}})
end

if __FILE__ == $0
  post_status(ARGV.join(' '))
end
