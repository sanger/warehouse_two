class AddIndexIndexesToCurrentTables < ActiveRecord::Migration
  TABLES_TO_INDEXES = {
    aliquots: [
      :receptacle_internal_id,
      [ :sample_internal_id, :receptacle_internal_id ],
      [ :study_internal_id, :receptacle_internal_id ]
    ],
    asset_links: [
      [ :ancestor_internal_id, :descendant_internal_id, :descendant_type ],
      [ :descendant_internal_id, :ancestor_internal_id, :ancestor_type ]
    ],
    batch_requests: [
      [ :target_asset_internal_id, :batch_uuid ],
      [ :source_asset_internal_id, :request_internal_id ]
    ],
    batches: [
      :created_by,
      :state
    ],
    library_tubes: [
      :name
    ],
    multiplexed_library_tubes: [
      :name
    ],
    plate_purposes: [
      :name
    ],
    plates: [
      :inserted_at
    ],
    requests: [
      :study_internal_id,
      { :name => :assets_via_internal_id, :columns => [ :target_asset_internal_id, :source_asset_internal_id, :target_asset_type ] },
      [ :target_asset_uuid, :source_asset_internal_id ]
    ],
    samples: [
      :name,
      :accession_number
    ],
    studies: [
      :name,
      :accession_number
    ],
    study_samples: [
      [ :sample_internal_id, :study_internal_id ],
      [ :sample_uuid, :study_internal_id ]
    ],
    tags: [
      [ :map_id, :internal_id ]
    ],
    wells: [
      [ :plate_barcode, :plate_barcode_prefix, :map ],
      :inserted_at
    ]
  }

  def change
    TABLES_TO_INDEXES.each do |name, indexes|
      change_table("current_#{name}", :bulk => true) do |t|
        indexes.each do |columns|
          t.index(*extract_index_from(columns))
        end
      end
    end
  end

  def extract_index_from(columns)
    columns, root = columns.is_a?(Hash) ? [columns[:columns], columns[:name]] : [columns, Array(columns).join('_')]
    [columns, :name => "#{root}_idx"]
  end
  private :extract_index_from
end
