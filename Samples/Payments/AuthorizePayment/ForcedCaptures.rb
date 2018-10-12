require 'cyberSource_client'

public
class ForcedCaptures
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "1234567890"
    request.client_reference_information = clientReferenceInformation

    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    authInformation = CyberSource::V2paymentsProcessingInformationAuthorizationOptions.new
    processingInformation.capture = "true"
    authInformation.auth_type = "verbal"
    authInformation.verbal_auth_code = "potato"
    processingInformation.authorization_options = authInformation
    request.processing_information = processingInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "VDP"
    billtoInformation.address1 = "901 Metro Center Blvd"
    billtoInformation.postal_code = "94404"
    billtoInformation.locality = "Foster City"
    billtoInformation.administrative_area = "CA"
    billtoInformation.first_name = "RTS"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "100"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation = CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "4111111111111111"
    cardInformation.expiration_month = "12"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  ForcedCaptures.new.main
end