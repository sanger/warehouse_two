Then /^the state of request "([^"]*)" is "([^"]*)"$/ do |uuid, state|
  assert_equal state, Request.find_by_uuid(uuid).state
end

