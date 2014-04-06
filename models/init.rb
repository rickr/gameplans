#encoding: utf-8
require 'sequel'

db_dir = "../shared/db"
db_fname = 'gameplans.sqlite3'
db_path = File.join(db_dir, db_fname)

DB = Sequel.sqlite(db_path)
puts "Opening db at #{db_path}"

ENV['DATABASE_URL'] = "sqlite://#{db_path}"


require_relative 'users'
require_relative 'projects'
require_relative 'documents'
require_relative 'doctypes'
require_relative 'docfields'

