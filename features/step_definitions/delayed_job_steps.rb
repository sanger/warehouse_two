When /^I create (\d+) delayed jobs for "([^"]*)"$/ do |num_delayed_jobs, resource_name|
  1.upto(num_delayed_jobs.to_i).each do |page|
    eval("Api::#{resource_name}").delay.parse_index_with_full_objects(page, 1)
  end
end


Given /^([1-9]|[1-9]\d+) pending delayed jobs are processed$/ do |count|
  Delayed::Worker.new(:quiet => ENV['LOUD_DELAYED_JOBS'].nil?).work_off(count.to_i)
  errors = Delayed::Job.all.map { |j| j.run_at? && j.last_error }.reject(&:blank?)
  raise StandardError, "Delayed jobs have failed #{errors.to_yaml}" if errors.present?
  raise StandardError, "There are #{Delayed::Job.count} jobs left to process" unless Delayed::Job.count.zero?
end

Given /^all pending delayed jobs are processed$/ do
  count = Delayed::Job.count
  raise StandardError, "There are no delayed jobs to process!" if count.zero?
  Given %Q{#{count} pending delayed jobs are processed}
end