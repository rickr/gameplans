#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'json'
require 'haml'

require 'sinatra/reloader' if development?
require 'pp' if development?


require_relative 'models/init.rb'


class GamePlans < Sinatra::Base
  set :bind, '0.0.0.0'
  enable :sessions

  configure :development do
    set :logging, true
    register Sinatra::Reloader
  end

  configure :production do
  end

  # Routes

  # MVP
  get '/' do
    erb :index, :locals => { :user => current_user }
  end

  post '/projects/add' do
    project_name = params[:projectName]
    Project.create(:user_id => current_user.id, :name => project_name)
    redirect '/'
  end

  get '/project/:project_id/?' do |project_id|
    #"You are at project #{project_name}"

    erb :"documents/index", :locals => {:project_id => project_id }
  end

  get '/project/:project_id/:document_id?' do |project_id, document_id|
    #"You are at document #{document_name} for the project #{project_id}"

    erb :"demo/project", :locals => {:project_id => project_id, :document_id => document_id }
  end


  get '/projects/:project_id/doctype/:doctypeid?' do |project_id, doctypeid|

    erb :"documents/create", :locals => {:project_id => project_id, :doctypeid => doctypeid }
  end



  get '/projects/:project_id/doctype/:doctypeid/create_objective' do |project_id, doctypeid|

    erb :"documents/create_objective", :locals => {:project_id => project_id, :doctypeid => doctypeid }
  end

  get '/projects/:project_id/doctype/:doctypeid/create_goals' do |project_id, doctypeid|
    erb :"documents/create_goals", :locals => {:project_id => project_id, :doctypeid => doctypeid }
  end

  get '/projects/:project_id/doctype/:doctypeid/create_risks' do |project_id, doctypeid|
    erb :"documents/create_risks", :locals => {:project_id => project_id, :doctypeid => doctypeid }
  end

  get '/projects/:project_id/doctype/:doctypeid/create_costs' do |project_id, doctypeid|
    erb :"documents/create_costs", :locals => {:project_id => project_id, :doctypeid => doctypeid }
  end

  get '/projects/:document_id/document_detail' do |document_id|
    erb :"documents/document_detail", :locals => {:document_id => document_id }
  end


  # Helpers
  def current_user
    # Stub for a real current user
    # Should return a user

    return User.first
  end

  run! if app_file == $0
end
