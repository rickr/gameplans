Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id

      String :name, :null=>false
      Int :project_id

      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end
    self[:users].insert(:name => 'DemoUser')
  end

  down do
    drop_table(:users)
  end
end
