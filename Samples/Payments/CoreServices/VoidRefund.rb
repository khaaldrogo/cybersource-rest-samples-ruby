require 'cyberSource_client'

public
class VoidRefund
  def main
    id = '5336263607286732204102'
    request = CyberSource::VoidRefundRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)
    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_void"
    request.client_reference_information = clientReferenceInformation
    data, status_code, headers = apiInstance.void_refund(request,id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidRefund.new.main
end
