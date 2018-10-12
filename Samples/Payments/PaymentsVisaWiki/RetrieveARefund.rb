require 'cyberSource_client'

public
class GetRefund
  def main
    id = '5335504389516958903526'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::RefundApi.new(apiClient)
    data, status_code, headers = apiInstance.get_refund(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetRefund.new.main
end
