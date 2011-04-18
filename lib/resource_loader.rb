def load(resource_names, number_of_pages = nil)
	failure_count = 0
  resource_names.each do |resource_name|
    begin
      eval("Api::#{resource_name}").parse_index_with_full_objects(1, number_of_pages)
    rescue Exception => ex
      failure_count = failure_count + 1
      Rails.logger.warn "Failed - #{resource_name} - #{ex}"
    end
  end
  
  # we don't use logger as we want it to appears in the cron emailsw
  puts "Failures in building warehouse two  #{resource_names.join(", ")} : #{failure_count}" if failure_count > 0
end
