require 'cyberSource_client'

public
class VoidCapture
  def main
    id = '5336240696026662104108'
    request = CyberSource::VoidCaptureRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)
    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_void"
    request.client_reference_information = clientReferenceInformation
    data, status_code, headers = apiInstance.void_capture(request,id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidCapture.new.main
end
