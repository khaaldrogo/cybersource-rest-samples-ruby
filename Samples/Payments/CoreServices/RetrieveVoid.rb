require 'cyberSource_client'

public
class GetVoid
  def main
    id = '5335528892726038303523'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)
    data, status_code, headers = apiInstance.get_void(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetVoid.new.main
end
