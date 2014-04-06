class DocType < Sequel::Model
  one_to_many :documents
  #one_to_many :fields
end
