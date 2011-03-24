class AddDataReleaseColumnsToStudy < ActiveRecord::Migration
  def self.up
    add_column :studies, :contains_human_dna, :string
    add_column :studies, :contaminated_human_dna, :string
    add_column :studies, :data_release_strategy, :string
    add_column :studies, :data_release_sort_of_study, :string
    add_column :studies, :ena_project_id, :string
    add_column :studies, :study_title, :string
    add_column :studies, :study_visibility, :string
  end

  def self.down
    remove_column :studies, :contains_human_dna
    remove_column :studies, :contaminated_human_dna
    remove_column :studies, :data_release_strategy
    remove_column :studies, :data_release_sort_of_study
    remove_column :studies, :ena_project_id
    remove_column :studies, :study_title
    remove_column :studies, :study_visibility
  end
end