Sequel.migration do
  up do
    create_table(:rows) do
      primary_key :id

      Int :document_id
      Int :doc_type_id
      Int :field_id
      String :header


      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end

    create_table(:fields) do
      primary_key :id

      Int :row_id, :null=>false
      String :question
      String :field
      String :value


      String :created_at, :null => false, :default => Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
      String :last_modified, :null => false, :default =>  Sequel.lit("DATETIME(CURRENT_TIMESTAMP)")
    end

    self[:rows].insert(:doc_type_id => 1, :header => 'Project: GamePlan MVP')
    self[:rows].insert(:doc_type_id => 1, :header => 'Mission Statement')
    self[:rows].insert(:doc_type_id => 1, :header => 'Objectives')
    self[:rows].insert(:doc_type_id => 1, :header => 'Goals')
    self[:rows].insert(:doc_type_id => 1, :header => 'Project Timeline')
    self[:rows].insert(:doc_type_id => 1, :header => 'Risks')
    self[:rows].insert(:doc_type_id => 1, :header => 'Costs')

    self[:fields].insert(:row_id => '1', :question => 'Briefly describe this project:', :field => 'Description')

    self[:fields].insert(:row_id => '2', :question => 'Why are you taking this endevour?', :field => 'Mission Statement')

    self[:fields].insert(:row_id => '3', :question => 'What is your primary objective for this project?', :field => 'Objective')
    self[:fields].insert(:row_id => '3', :question => 'Any additional objectives?', :field => 'Objective')
    self[:fields].insert(:row_id => '3', :question => 'Any additional objectives?', :field => 'Objective')

    self[:fields].insert(:row_id => '4', :question => 'What are the project goals?', :field => 'Goal')
    self[:fields].insert(:row_id => '4', :question => 'Who is responsible for these goals?', :field => 'Goal Assignment')

    self[:fields].insert(:row_id => '5', :question => 'What is the project start date?', :field => 'Start Date')
    self[:fields].insert(:row_id => '5', :question => 'What is the project check in date?', :field => 'Check In Date')
    self[:fields].insert(:row_id => '5', :question => 'What is the project end date?', :field => 'End Date')

    self[:fields].insert(:row_id => '6', :question => 'Describe your project risk', :field => 'Risk Description')
    self[:fields].insert(:row_id => '6', :question => 'Describe your plans to mitigate this risk', :field => 'Risk Mitigation')

    self[:fields].insert(:row_id => '7', :question => 'How much will your project cost?', :field => 'Project Cost')
    self[:fields].insert(:row_id => '7', :question => 'How much backup money do you need?', :field => 'Contingency Funds')
    self[:fields].insert(:row_id => '7', :question => 'What is the total cost?', :field => 'Total Cost')
  end

  down do
    drop_table(:rows)
    drop_table(:fields)
  end
end
