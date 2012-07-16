class AddStudySampleIndexToCurrentStudySamples < ActiveRecord::Migration
  def change
    change_table(:current_study_samples) do |t|
      t.index([ :study_internal_id, :sample_internal_id ], :name => 'study_internal_id_sample_internal_id_idx')
    end
  end
end
