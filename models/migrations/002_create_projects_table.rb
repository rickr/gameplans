Sequel.migration do
  up do
    create_table(:projects) do
      primary_key :id
      String :name, :null=>false

      Int :document_id
      Int :project_id
      Int :user_id, :null => false

      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end

    self[:projects].insert(:name => 'Demo Project', :user_id => '1')
  end

  down do
    drop_table(:projects)
  end
end
