#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'json'
require 'haml'

require 'sinatra/flash'

require 'sinatra/reloader' if development?
require 'pp' if development?


require_relative 'models/init.rb'

module Sinatra
  module Flash
    module Style
      def styled_flash(key=:flash)
        return "" if flash(key).empty?
        id = (key == :flash ? "flash" : "flash_#{key}")
        close = '<a class="close" data-dismiss="alert" href="#">×</a>'
        messages = flash(key).collect {|message| " <div class='alert alert-#{message[0]}'>#{close}\n #{message[1]}</div>\n"}
        "<div id='#{id}'>\n" + messages.join + "</div>"
      end
    end
  end
end


class GamePlans < Sinatra::Base
  set :bind, '0.0.0.0'
  enable :sessions
  register Sinatra::Flash

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
    project = Project.create(:user_id => current_user.id, :name => project_name)
    flash[:info] = "Project created!"
    redirect "/project/#{project.id}"
  end


  # List documents, create new doc modal
  get '/project/:project_id/?' do |project_id|
    project = Project.find({:id => project_id})
    documents = project.documents
    doc_types = DocType.all

    erb :"documents/index", :locals => {:project_id => project.name, :documents => documents, :doc_types => doc_types}
  end

  post '/project/:project_id/document/add' do |project_id|
    project_id = params[:project_id]
    doc_type = params[:doc_type]

    document = Document.create(:project_id => project_id, :doc_type_id => doc_type)
    lash[:info] = "New #{document.doc_type.name} doc created!"
  end

  get '/project/:project_id/document/:document_id/view/?' do |project_id, document_id|
    document = Document.find(:id => document_id)
    pp document.rows
  end

  get '/project/:project_id/document/:document_id/edit/?' do |project_id, document_id|
    document = Document.find(:id => document_id)
    step = (document.rows.count + 1).to_s
    redirect "#{request.url}/#{step}"
  end

  get '/project/:project_id/document/:document_id/edit/:step' do |project_id, document_id, step|
    #puts Document.find(:id => document_id)
    document = Document.find(:id => document_id)
    doc_type = document.doc_type
    rows = doc_type.rows
    row = doc_type.rows[step.to_i - 1]
    fields = row.fields
    steps = rows.count

    erb :'documents/edit', :locals => { :doc_type => doc_type, 
                                        :row => row, 
                                        :fields => fields,
                                        :document_id => document_id,
                                        :this_step => step.to_i,
                                        :steps => steps.to_i
                                      }
  end



  # Static demo
  #get '/project/:project_id/?' do |project_id|
    #"You are at project #{project_name}"
  #  erb :"documents/index", :locals => {:project_id => project_id }
  #end

  get '/project/:project_id/:document_id?' do |project_id, document_id|
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
