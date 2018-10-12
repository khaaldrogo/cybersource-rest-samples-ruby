require 'cyberSource_client'

public
class VerifiedByVisa
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC45562-2"
    request.client_reference_information = clientReferenceInformation

    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "vbv"
    request.processing_information = processingInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "VDP"
    billtoInformation.address1 = "201 S. Division St."
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.locality = "Ann Arbor"
    billtoInformation.administrative_area = "MI"
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
    cardInformation =CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "4111111111111111"
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    cardInformation.type = "001"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation

    consumerAuthInformation = CyberSource::V2paymentsConsumerAuthenticationInformation.new
    consumerAuthInformation.cavv = "EHuWW9PiBkWvqE5juRwDzAUFBAk"
    consumerAuthInformation.eci_raw = "02"
    consumerAuthInformation.xid = "lEmYpm61EduaVZjPG1/HsgkAAQc="
    request.consumer_authentication_information = consumerAuthInformation

    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VerifiedByVisa.new.main
end