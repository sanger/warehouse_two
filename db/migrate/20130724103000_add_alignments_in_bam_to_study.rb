class AddAlignmentsInBamToStudy < ActiveRecord::Migration
  def change
    change_resource_table(:studies) do |t|
      t.boolean(:alignments_in_bam, :null => false, :default => true)
    end
  end
end
