def load(resource_names, number_of_pages = nil)
	failure_count = 0
  resource_names.each do |resource_name|
    begin
      eval("Api::#{resource_name}").parse_index_with_full_objects(number_of_pages)
    rescue Exception => ex
      failure_count = failure_count + 1
      Rails.logger.warn "Failed - #{resource_name} - #{ex}"
    end
  end
  
  # we don't use logger as we want it to appears in the cron emailsw
  puts "Failures in building warehouse two  #{resource_names.join(", ")} : #{failure_count}" if failure_count > 0
end

def remove_duplicated_history(resource_name)
  total_deleted = 0
  # remove any historical rows which are the same as the current one
  eval("#{resource_name}").find_each(:conditions => { :is_current => true }) do |asset|
    num_deleted = 0
    historical_assets = eval("#{resource_name}").find_all_by_uuid_and_is_current(asset.uuid, false)
    historical_assets.each do |old_asset|
      next if asset.updated_values_for_given_row?(old_asset)
      old_asset.destroy
      num_deleted += 1
    end
    total_deleted += num_deleted
    puts "#{asset.uuid} - history deleted: #{num_deleted} - total deleted: #{total_deleted}"
  end
end

