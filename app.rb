#!/usr/bin/env ruby

require 'haml'
require 'sinatra'
require 'sinatra/activerecord'

require './models/status.rb'
require './db/db.rb'

get '/' do
  @statuses = Status.order('created_at DESC').pluck(:status)
  haml :index
end

post '/' do
  Status.create(status: params[:status])
end
