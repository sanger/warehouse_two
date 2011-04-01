class AddAccessionNumbersToStudy < ActiveRecord::Migration
  def self.up
    add_column :studies, :ega_dac_accession_number, :string
    add_column :studies, :array_express_accession_number, :string
    add_column :studies, :ega_policy_accession_number, :string
    
  end

  def self.down
    remove_column :studies, :ega_dac_accession_number
    remove_column :studies, :array_express_accession_number
    remove_column :studies, :ega_policy_accession_number
  end
end