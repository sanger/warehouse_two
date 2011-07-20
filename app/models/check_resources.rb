class CheckResources
  
  def self.update_or_delete_resources(num_days_cutoff)
    UuidObject.find_each(:conditions => ["checked_at < SUBDATE(NOW(), INTERVAL ?  DAY) AND object_name != 'events' AND deleted != 1", num_days_cutoff]) do |uuid_object|
      uuid_object.update_or_delete( Time.now.utc )
    end
    
    nil
  end

end

