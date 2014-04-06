Sequel.migration do
  up do
    create_table(:doc_types) do
      primary_key :id

      String :name, :null=>false, :unique => true
      String :document_id, :unique => false

      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end

    self[:doc_types].insert(:name => 'Project Charter')
    self[:doc_types].insert(:name => 'Project Management Plan')
    self[:doc_types].insert(:name => 'Risk Log')
    self[:doc_types].insert(:name => 'Project Schedule')
    self[:doc_types].insert(:name => 'Project Cost Management')
  end

  down do
    drop_table(:doc_types)
  end
end
