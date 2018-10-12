require 'cyberSource_client'

public
class CapturePayment
  def main
    id = '5350275921706258204002'
    request = CyberSource::CapturePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::CaptureApi.new(apiClient)
    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC50171_3"
    request.client_reference_information = clientReferenceInformation
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    amountDetails = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountDetails.total_amount = "102.21"
    amountDetails.currency ="USD"
    orderInformation.amount_details = amountDetails
    request.order_information = orderInformation
    data, status_code, headers = apiInstance.capture_payment(request,id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  CapturePayment.new.main
end
