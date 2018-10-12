require 'cyberSource_client'

public
class GetReversal
  def main
    id = '5337070055666242603528'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::ReversalApi.new(apiClient)
    data, status_code, headers = apiInstance.get_auth_reversal(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetReversal.new.main
end
