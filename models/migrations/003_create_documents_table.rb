Sequel.migration do
  up do
    create_table(:documents) do
      primary_key :id

      #String :name, :null=>false, :unique => true

      Int :project_id, :null =>false
      Int :doc_type_id, :null =>false
      Int :doc_field_id


      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end
  end

  down do
    drop_table(:documents)
  end
end
