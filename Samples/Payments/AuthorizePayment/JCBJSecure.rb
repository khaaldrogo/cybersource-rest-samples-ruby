require 'cyberSource_client'

public
class JCBJSecure
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC54853-4"
    request.client_reference_information = clientReferenceInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.capture = "true"
    processingInformation.commerce_indicator = "JS"
    request.processing_information = processingInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.first_name = "RTS"
    billtoInformation.last_name = "VDP"
    billtoInformation.phone_number = "6504327113"
    billtoInformation.address1 = "901 Metro Center Blvd"
    billtoInformation.postal_code = "94404"
    billtoInformation.locality = "Foster City"
    billtoInformation.administrative_area = "CA"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "100"
    amountInformation.currency = "JPY"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation =CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "3540599999991047"
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    cardInformation.type = "007"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation

    consumerAuthenticationInformation = CyberSource::V2paymentsConsumerAuthenticationInformation.new
    consumerAuthenticationInformation.cavv = "EHuWW9PiBkWvqE5juRwDzAUFBAk+="
    consumerAuthenticationInformation.eci_raw = "05"
    consumerAuthenticationInformation.xid = "lEmYpm61EduaVZjPG1/HsgkAAQc="
    request.consumer_authentication_information = consumerAuthenticationInformation
    
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  JCBJSecure.new.main
end
