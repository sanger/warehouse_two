Then /^submission "([^"]*)" should only have the following submitted assets:$/ do |submission_uuid, table|
  submitted_assets = SubmittedAsset.find_all_by_submission_uuid(submission_uuid)
  assert_equal [], submitted_assets.map(&:asset_uuid) - table.rows.flatten
end