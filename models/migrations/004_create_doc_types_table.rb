Sequel.migration do
  up do
    create_table(:doc_types) do
      primary_key :id

      String :name, :null=>false, :unique => true
      String :document_id, :unique => false

      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end

    self[:doc_types].insert(:name => 'DocType1')
    self[:doc_types].insert(:name => 'DocType2')
    self[:doc_types].insert(:name => 'DocType3')
    self[:doc_types].insert(:name => 'DocType4')
    self[:doc_types].insert(:name => 'DocType5')
  end

  down do
    drop_table(:doc_types)
  end
end
