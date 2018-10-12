require 'cyberSource_client'

public
class VoidPayment
  def main
    id = '5341640025656635503527'
    request = CyberSource::VoidPaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)
    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC50171_3"
    request.client_reference_information = clientReferenceInformation
    data, status_code, headers = apiInstance.void_payment(request,id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidPayment.new.main
end
