require 'cyberSource_client'

public
class AltTestHaveQuestions
  def main
    request = CyberSource::AuthReversalRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "12345678"
    request.client_reference_information = clientReferenceInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "test"
    billtoInformation.address1 = "201 S. Division St."
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.locality = "Ann Arbor"
    billtoInformation.administrative_area = "MI"
    billtoInformation.first_name = "test"
    billtoInformation.phone_number = "999999999"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    recipientInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation = CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "5555555555554444"
    cardInformation.expiration_month = "12"
    recipientInformation.card = cardInformation

    reversalInformation = CyberSource::V2paymentsidreversalsReversalInformation.new
    reversalAmountDetails = CyberSource::V2paymentsidreversalsReversalInformationAmountDetails.new
    reversalAmountDetails.total_amount = "3000.00"
    request.reversal_information = reversalInformation
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AltTestHaveQuestions.new.main
end
