Sequel.migration do
  up do
    create_table(:doc_types) do
      primary_key :id

      String :name, :null=>false, :unique => true
      String :field, :null=>false, :unique => false
      String :document_id, :unique => false
      #String :body, :null=>false, :unique => true

      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end
  end

  down do
    drop_table(:doc_types)
  end
end
