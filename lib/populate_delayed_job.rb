def create_delayed_jobs(resource_name, total_number_of_pages)
  number_of_pages_per_job = 10
  current_page = 1
	failure_count = 0

  1.upto((total_number_of_pages/(number_of_pages_per_job.to_f)).ceil).each do |interval_number|
    begin
      # load newest data first for all models
      job = Delayed::PerformableMethod.new(eval("Api::#{resource_name}"), :parse_index_with_full_objects, [current_page, number_of_pages_per_job])
      Delayed::Job.enqueue(job, interval_number)

    rescue Exception => ex
      failure_count = failure_count + 1
      Rails.logger.warn "Failed - #{resource_name} - #{ex}"
    end
    current_page += number_of_pages_per_job
  end
 
  # we don't use logger as we want it to appears in the cron emailsw
  puts "Failures in building warehouse two  #{resource_name} : #{failure_count}" if failure_count > 0
end
