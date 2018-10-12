require 'cyberSource_client'

public
class GetCredit
  def main
    id = '5332036920866055004101'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::CreditApi.new(apiClient)
    data, status_code, headers = apiInstance.get_credit(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetCredit.new.main
end
