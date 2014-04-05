Sequel.migration do
  up do
    create_table(:doc_fields) do
      primary_key :id

      Int :document_id, :null=>false

      String :field, :null => false
      #String :value, :null => false

      #String :name, :null=>false, :unique => true

      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end
  end

  down do
    drop_table(:doc_fields)
  end
end
