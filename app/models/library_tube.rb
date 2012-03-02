class LibraryTube < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id                 => :id,
      :name                        => :name,
      :barcode                     => :barcode,
      :barcode_prefix              => :barcode_prefix,
      :state                       => :qc_state,
      :closed                      => :closed,
      :two_dimensional_barcode     => :two_dimensional_barcode,
      :concentration               => :concentration,
      :volume                      => :volume,
      :sample_uuid                 => :sample_uuid,
      :sample_internal_id          => :sample_internal_id,
      :sample_name                 => :sample_name,
      :tag_uuid                    => :tag_uuid,
      :tag_internal_id             => :tag_internal_id,
      :expected_sequence           => :expected_sequence,
      :tag_map_id                  => :tag_map_id,
      :tag_group_name              => :tag_group_name,
      :tag_group_uuid              => :tag_group_uuid,
      :tag_group_internal_id       => :tag_group_internal_id,
      :source_request_internal_id  => :source_request_internal_id,
      :source_request_uuid         => :source_request_uuid,
      :library_type                => :library_type,
      :fragment_size_required_from => :fragment_size_required_from,
      :fragment_size_required_to   => :fragment_size_required_to,
      :scanned_in_date             => :scanned_in_date,
      :public_name                 => :public_name
    }
  end

end
