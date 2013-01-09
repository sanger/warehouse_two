class AddIndexToSangerSampleId < ActiveRecord::Migration
  def change
    change_table(:current_samples, :bulk => true) do |t|
      t.index([:sanger_sample_id], :name => :sanger_sample_id_idx)
    end
  end
end
