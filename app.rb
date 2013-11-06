#!/usr/bin/env ruby

require 'bcrypt'
require 'haml'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/json'

require_relative 'db/db'
Dir['./models/*'].each { |file| require file }

class App < Sinatra::Base
  after do
    ActiveRecord::Base.connection.close
  end

  get '/' do
    @statuses = Status.all
    haml :index
  end

  get '/user/:name' do |name|
    json statuses: User.where(name: name).first.statuses
  end

  post '/' do
    if params[:user]
      if params[:password]
        User.create(name: params[:user], password: params[:password])
      else
        User.where(name: params[:user]).first.statuses.create(status: params[:status])
      end
    else
      Status.create(status: params[:status])
    end
  end
end

if __FILE__ == $0
  App.run!
end
