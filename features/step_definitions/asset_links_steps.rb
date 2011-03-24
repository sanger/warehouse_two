Then /^an assetlink should exist between assets "([^"]*)" and "([^"]*)"$/ do |ancestor_uuid, descendant_uuid|
  assert_not_nil AssetLink.find_by_ancestor_uuid_and_descendant_uuid(ancestor_uuid, descendant_uuid)
end

Then /^the link between assets "([^"]*)" and "([^"]*)" should contain:$/ do |ancestor_uuid, descendant_uuid, table|
  asset_link = AssetLink.find_by_ancestor_uuid_and_descendant_uuid_and_is_current(ancestor_uuid, descendant_uuid,true)
  table.rows_hash.each do |attribute_name, attribute_value|
    assert_equal attribute_value, asset_link.send(attribute_name).to_s
  end
end

Then /^the asset link table should be of size (\d+)$/ do |table_size|
  assert_equal table_size.to_i, AssetLink.count
end