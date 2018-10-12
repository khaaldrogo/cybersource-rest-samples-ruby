require 'cyberSource_client'

public
class VoiceAuthReferral
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC45561-10"
    request.client_reference_information = clientReferenceInformation

    deviceInformation = CyberSource::V2paymentsDeviceInformation.new
    deviceInformation.ip_address = "66.185.179.2"
    deviceInformation.host_name = "cybersource.com"
    request.consumer_authentication_information = deviceInformation

    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    authInformation = CyberSource::V2paymentsProcessingInformationAuthorizationOptions.new
    authInformation.ignore_avs_result = "Y"
    authInformation.ignore_cv_result = "N"
    processingInformation.authorization_options = authInformation
    request.processing_information = processingInformation

    buyerInformation = CyberSource::V2paymentsBuyerInformation.new
    buyerInformation.personal_identification = [ "123* 4sÆ" ]
    request.buyer_information = buyerInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "VDP"
    billtoInformation.address2 = "Address 2"
    billtoInformation.address1 = "201 S. Division St."
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.locality = "Ann Arbor"
    billtoInformation.administrative_area = "MI"
    billtoInformation.first_name = "RTS"
    billtoInformation.phone_number = "999999999"
    billtoInformation.district = "MI"
    billtoInformation.building_number = "123"
    billtoInformation.company = "Visa"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "102.21"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation = CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "5555555555554444"
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    cardInformation.type = "002"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoiceAuthReferral.new.main
end