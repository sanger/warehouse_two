class IgnoreableResource
  def self.create_or_update_from_json(*args)
    self.new
  end

  def id
    'ignored'
  end

  def inserted_record?
    false
  end
end
