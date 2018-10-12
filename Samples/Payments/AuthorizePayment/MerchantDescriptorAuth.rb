require 'cyberSource_client'

public
class AuthorizationOnly
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "1234567890"
    request.client_reference_information = clientReferenceInformation

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
    billtoInformation.company = "Visa"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = 72210
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation = CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "4111111111111111"
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation

    merchantInformation = CyberSource::V2paymentsMerchantInformation.new
    merchantDescriptor = CyberSource::V2paymentsMerchantInformationMerchantDescriptor.new
    merchantDescriptor.name = "Test"
    merchantDescriptor.contact = "123-456-7890"
    merchantInformation.merchant_descriptor = merchantDescriptor
    request.merchant_information = merchantInformation

    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthorizationOnly.new.main
end