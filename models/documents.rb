class Document < Sequel::Model
  many_to_one :project
  one_to_one :doc_type
  one_to_many :doc_fields
end
