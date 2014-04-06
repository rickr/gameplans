class Row < Sequel::Model
  one_to_many :fields
end
