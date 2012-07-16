class AddIndexesWithCurrentFromAndCurrentTo < ActiveRecord::Migration
  def change
    change_table(:aliquots) do |t|
      t.index([:receptacle_uuid, :sample_uuid, :current_to, :current_from], :name => 'receptacle_uuid_and_sample_uuid_and_current_idx')
      t.index([:sample_uuid, :receptacle_uuid, :current_to, :current_from], :name => 'sample_uuid_and_receptacle_uuid_and_current_idx')
    end
    change_table(:asset_links) do |t|
      t.index([:ancestor_uuid, :descendant_uuid, :current_to, :current_from], :name => 'ancestor_uuid_and_descendant_uuid_and_current_idx')
    end
    change_table(:billing_events) do |t|
      t.index([:project_uuid, :request_uuid, :current_to, :current_from], :name => 'project_uuid_and_request_uuid_and_current_idx')
    end
    change_table(:orders) do |t|
      t.index([:study_uuid, :current_to, :current_from, :project_uuid], :name => 'study_uuid_and_current_and_project_uuid_idx')
      t.index([:study_uuid, :current_to, :project_uuid, :current_from], :name => 'study_uuid_and_current_to_and_project_uuid_and_current_from_idx')
    end
    change_table(:quotas) do |t|
      t.index([:project_uuid, :request_type, :current_to, :current_from], :name => 'project_uuid_and_request_type_and_current_idx')
    end
    change_table(:requests) do |t|
      t.index([:source_asset_uuid, :request_type, :current_to, :current_from], :name => 'source_asset_uuid_and_request_type_and_current_idx')
      t.index([:target_asset_uuid, :request_type, :current_to, :current_from], :name => 'target_asset_uuid_and_request_type_and_current_idx')
      t.index([:submission_uuid, :current_to, :current_from], :name => 'submission_uuid_and_current_idx')
    end
    change_table(:samples) do |t|
      t.index([:internal_id, :current_to, :current_from], :name => 'internal_id_and_current_idx')
    end
    change_table(:studies) do |t|
      t.index([:internal_id, :current_to, :current_from], :name => 'internal_id_and_current_idx')
    end
    change_table(:study_samples) do |t|
      t.index([:sample_uuid, :study_uuid, :current_to, :current_from], :name => 'sample_uuid_and_study_uuid_and_current_idx')
    end
  end
end
