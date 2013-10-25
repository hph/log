#!/usr/bin/env ruby

require 'sinatra'

post '/' do
  puts params[:status]
end
