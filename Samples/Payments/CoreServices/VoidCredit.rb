require 'cyberSource_client'

public
class VoidCredit
  def main
    id = "5336378279036983404106"
    request = CyberSource::VoidCreditRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "12345678"
    request.client_reference_information = clientReferenceInformation
    
    data, status_code, headers = apiInstance.void_credit(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidCredit.new.main
end
