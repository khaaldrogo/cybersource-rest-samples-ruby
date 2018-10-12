require 'cyberSource_client'

public
class GetPayment
  def main
    id = '5342285687236355504101'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)
    data, status_code, headers = apiInstance.get_payment(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  GetPayment.new.main
end
