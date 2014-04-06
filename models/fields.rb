class Field < Sequel::Model
  many_to_one :row
end
