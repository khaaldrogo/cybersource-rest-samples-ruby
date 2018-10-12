require 'cyberSource_client'

public
class AuthReversalFull
  def main
    id = "5334411871436531903527"
    request = CyberSource::AuthReversalRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::ReversalApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC50171_1"
    request.client_reference_information = clientReferenceInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    reversalInformation = CyberSource::V2paymentsidreversalsReversalInformation.new
    reversalAmountDetails = CyberSource::V2paymentsidreversalsReversalInformationAmountDetails.new
    reversalAmountDetails.total_amount = "100.00"
    reversalInformation.amount_details = reversalAmountDetails
    request.reversal_information = reversalInformation
    data, status_code, headers = apiInstance.auth_reversal(id, request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthReversalFull.new.main
end
