class Project < Sequel::Model
  one_to_many :users
  one_to_many :documents
end
