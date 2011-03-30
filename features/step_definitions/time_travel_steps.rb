Given /^all of this is happening at exactly "([^\"]+)"$/ do |time_as_string|
  Timecop.freeze(Time.parse(time_as_string))
end