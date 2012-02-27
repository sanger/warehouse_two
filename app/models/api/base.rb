class Api::Base < ActiveResource::Base
  self.site = "#{configatron.api_url}/#{configatron.api_version}"
  self.format = :json
  self.timeout = 600
  if configatron.proxy
    self.proxy = configatron.proxy
  end
end
