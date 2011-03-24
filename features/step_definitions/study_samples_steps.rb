Then /^a study sample link should exist between study "([^"]*)" and sample "([^"]*)"$/ do |study_uuid, sample_uuid|
  StudySample.find_by_sample_uuid_and_study_uuid_and_is_current(sample_uuid, study_uuid,true)
end

Then /^the link between study "([^"]*)" and sample "([^"]*)" should contain:$/ do |study_uuid, sample_uuid, table|
  study_sample = StudySample.find_by_sample_uuid_and_study_uuid_and_is_current(sample_uuid, study_uuid,true)
  
  table.rows_hash.each do |attribute_name, attribute_value|
    assert_equal attribute_value, study_sample.send(attribute_name).to_s
  end
end


Then /^the study sample table should be of size (\d+)$/ do |table_size|
  assert_equal table_size.to_i, StudySample.count
end