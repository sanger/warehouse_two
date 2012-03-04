class DropRedundantSubmissionColumns < ActiveRecord::Migration
  REDUNDANT_COLUMNS = [
    :study_name,
    :study_uuid,
    :project_name,
    :project_uuid,
    :read_length,
    :fragment_size_required_from,
    :fragment_size_required_to,
    :library_type,
    :sequencing_type,
    :insert_size,
    :number_of_lanes,
    :template_name,
    :comments
  ]

  def self.up
    alter_table(:submissions) do |table|
      REDUNDANT_COLUMNS.map(&table.method(:remove_column))
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Cannot put redundant columns back in!"
  end
end
