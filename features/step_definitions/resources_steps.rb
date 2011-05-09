Given /^the "([^"]*)" resource exists$/ do |resource_name|
  name = resource_name.methodize
  base_path = File.join(File.dirname(__FILE__), "..", "data")
  resource_page_1 =  IO.read(File.join(base_path, "#{name}_page_1").to_s)
  resource_page_2 =  IO.read(File.join(base_path, "#{name}_page_2").to_s)
  ActiveResource::HttpMock.respond_to do |mock|
    mock.get "/#{configatron.api_version}/#{name.pluralize}.json?page=1", {}, resource_page_1
    mock.get "/#{configatron.api_version}/#{name.pluralize}.json?page=2", {}, resource_page_2
    mock.get "/#{configatron.api_version}/#{name.pluralize}.json?page=3", {}, '[]'
  end
end

When /^I connect to the "([^"]*)" resource and save the data$/ do |resource_name|
  eval("Api::#{resource_name}").parse_index_with_full_objects
end

Then /^I should be able to find UUID "([^"]*)" in "([^"]*)" the warehouse$/ do |uuid,resource_name|
  assert_not_nil eval("#{resource_name}").find_by_uuid(uuid)
  assert_not_nil UuidObject.find_by_uuid(uuid)
end


Then /^UUID "([^"]*)" in "([^"]*)" should have an inserted at time of "([^"]*)"$/ do |uuid, resource_name, time|
   obj = eval("#{resource_name}").find_by_uuid(uuid)
   assert_equal Time.parse(time.to_s), Time.parse(obj.inserted_at.to_s)
end


Given /^the "([^"]*)" resource returns the JSON:$/ do |resource_name, resource_json|
  name = resource_name.methodize
  resource_page_1 =  resource_json
  ActiveResource::HttpMock.respond_to do |mock|
    mock.get "/#{configatron.api_version}/#{name.pluralize}.json?page=1", {}, resource_page_1
    mock.get "/#{configatron.api_version}/#{name.pluralize}.json?page=2", {}, '[]'
  end
end


Then /^launch the debugger$/ do
  debugger
end


Then /^([^"]*) "([^"]*)" in the warehouse should contain:$/ do |object_name, uuid, table|
  if eval(object_name).new.respond_to?(:is_current)
    object = eval(object_name).find_by_uuid_and_is_current(uuid,true)
  else
    object = eval(object_name).find_by_uuid(uuid)
  end
  
  table.rows_hash.each do |attribute_name, attribute_value|
    assert_equal attribute_value, object.send(attribute_name).to_s
  end
end

Then /^([^"]*) "([^"]*)" in the warehouse with history should contain:$/ do |object_name, uuid, table|
  object = eval(object_name).find_by_uuid(uuid)

  table.rows_hash.each do |attribute_name, attribute_value|
    assert_equal attribute_value, object.send(attribute_name).to_s
  end
end


Given /^the remote "([^"]*)" with UUID "([^"]*)" has been deleted$/ do |resource_name, uuid|
  ActiveResource::HttpMock.respond_to do |mock|
    mock.get "/#{configatron.api_version}/#{resource_name.methodize.pluralize}/#{uuid}.json", {}, nil, 404
  end
end

When /^I sync the remote object with UUID "([^"]*)"$/ do |uuid|
  UuidObject.find_by_uuid(uuid).update_or_delete(Time.now.utc)
end

Given /^the remote "([^"]*)" with UUID "([^"]*)" returns this JSON:$/ do |resource_name, uuid, resource_json|
  ActiveResource::HttpMock.respond_to do |mock|
    mock.get "/#{configatron.api_version}/#{resource_name.methodize.pluralize}/#{uuid}.json", {}, resource_json
  end
end


Then /^the ([^"]*) table should have (\d+) row with UUID "([^"]*)"$/ do |object_name, num_rows, uuid|
  object_count = eval(object_name).find_all_by_uuid(uuid).count
  assert_equal num_rows.to_i, object_count
end
