class Document < Sequel::Model
  many_to_one :project
  many_to_one :doc_type
  one_to_many :doc_fields

  def completed
    # Stub for completed value of docuent type
    # Could be calc'd by num of fields and num of answers in DB
    rand(100)
  end

end
