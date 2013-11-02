#!/usr/bin/env ruby

require 'bcrypt'
require 'haml'
require 'sinatra/base'
require 'sinatra/activerecord'

require_relative 'db/db'
Dir['./models/*'].each { |file| require file }

class App < Sinatra::Base
  after do
    ActiveRecord::Base.connection.close
  end

  get '/' do
    @statuses = Status.order('created_at DESC').pluck(:status)
    haml :index
  end

  post '/' do
    Status.create(status: params[:status])
  end
end

if __FILE__ == $0
  App.run!
end
