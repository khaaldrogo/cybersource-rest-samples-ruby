require 'cyberSource_client'

public
class AuthReversal
  def main
    # enter payment Id
    id = '5337069774856224603522'
    request = CyberSource::AuthReversalRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::ReversalApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC50171_3"
    request.client_reference_information = clientReferenceInformation
    reversalInformation = CyberSource::V2paymentsidreversalsReversalInformation.new
    reversalInformation.reason = "tes"#ting"
    amountDetails = CyberSource::V2paymentsidreversalsReversalInformationAmountDetails.new
    amountDetails.total_amount = "102.21"
    reversalInformation.amount_details = amountDetails
    request.reversal_information = reversalInformation
    data, status_code, headers = apiInstance.auth_reversal(id, request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthReversal.new.main
end
