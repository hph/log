#!/usr/bin/env ruby

require 'haml'
require 'sinatra'
require 'sinatra/activerecord'

Dir['./models/*.rb', './config/*.rb'].each { |file| require file }

get '/' do
  @statuses = Status.select(:status).order('created_at DESC')
  haml :index
end

post '/' do
  Status.create(status: params[:status])
end
