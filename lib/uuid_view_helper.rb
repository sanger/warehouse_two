module UuidViewHelper
  TABLES_TO_EXTRA_COLUMNS = {
    # TABLE                             =>   name?  id?
    :aliquots                           => [ false, false ],
    :asset_audits                       => [ false, false ],
    :asset_freezers                     => [ true,  false ],
    :asset_links                        => [ false, false ],
    :batch_requests                     => [ false, false ],
    :batches                            => [ false, false ],
    :billing_events                     => [ false, false ],
    :events                             => [ false, false ],
    :lanes                              => [ true,  true  ],
    :library_tubes                      => [ true,  true  ],
    :multiplexed_library_tubes          => [ true,  true  ],
    :plate_purposes                     => [ true,  false ],
    :plates                             => [ true,  true  ],
    :projects                           => [ true,  true  ],
    :quotas                             => [ false, false ],
    :requests                           => [ false, true  ],
    :sample_tubes                       => [ true,  true  ],
    :samples                            => [ true,  true  ],
    :studies                            => [ true,  true  ],
    :submissions                        => [ false, true  ],
    :tags                               => [ false, false ],
    :wells                              => [ true,  true  ]
  }

  def rebuild_uuid_view
    selects = TABLES_TO_EXTRA_COLUMNS.map do |table, (has_name, has_internal_id)|
      columns = [ :uuid, 'HEX(uuid) AS decoded_uuid', :checked_at, :last_updated, :created, 'FALSE AS deleted' ]
      columns << (has_name        ? :name        : 'NULL AS name')
      columns << (has_internal_id ? :internal_id : 'NULL AS internal_id')
      columns << "#{table.to_s.inspect} AS object_name"
      "SELECT #{columns.join(',')} FROM #{table} WHERE is_current=TRUE AND uuid IS NOT NULL"
    end

    create_view :uuid_objects, "(#{selects.join(') UNION (')})" do |view|
      view.column :uuid
      view.column :decoded_uuid
      view.column :object_name
      view.column :internal_id
      view.column :name
      view.column :checked_at
      view.column :created
      view.column :last_updated
      view.column :deleted
    end
  end
end
