#!/usr/bin/env ruby

require 'httparty'
require 'io/console'
require 'slop'

require_relative 'app'

def get_status(server, user)
  HTTParty.get("#{server}/user/#{user}.json")
end

def post_status(server, status, user)
  HTTParty.post(server, {body: {status: status, user: user}})
end

def create_user(server, user, password)
  HTTParty.post(server, {body: {user: user, password: password}})
end

def get_opts
  Slop.parse do
    banner 'Usage: status.rb [options] status'
    on :h, :help,     'Show this help message',    argument: :optional
    on :c, :create=,  'Create a new user by name', argument: :optional
    on :m, :message=, 'Status message to post',    argument: :optional
    on :u, :user=,    'Display statuses by user',  argument: :optional
    on :s, :server=,  'Server to post status to',  argument: :optional,
       default: ENV['STATUS_SERVER'] || 'http://localhost:4567/'
  end
end

def process_opts(opts)
  if opts.help?
    puts opts
  elsif opts.create?
    print 'Password: '
    password = STDIN.noecho(&:gets).chomp
    create_user(opts[:server], opts[:create], password)
  elsif opts.message?
    post_status(opts[:server], opts[:message], opts[:user])
  elsif opts.user?
    get_status(opts[:server], opts[:user])['statuses'].each do |status|
      puts status['status']
    end
  end
end

if __FILE__ == $0
  process_opts(get_opts)
end
