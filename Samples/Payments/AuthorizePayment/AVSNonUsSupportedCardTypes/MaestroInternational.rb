require 'cyberSource_client'

public
class MaestroInternational
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC45555-1"
    request.client_reference_information = clientReferenceInformation

    consumerAuthInformation = CyberSource::V2paymentsConsumerAuthenticationInformation.new
    consumerAuthInformation.cavv = "EHuWW9PiBkWvqE5juRwDzAUFBAk="
    consumerAuthInformation.ucaf_collection_indicator = "3"
    consumerAuthInformation.ucaf_authentication_data = "EHuWW9PiBkWvqE5juRwDzAUFBAk"
    request.consumer_authentication_information = consumerAuthInformation

    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "spa"
    request.processing_information = processingInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "SG"
    billtoInformation.last_name = "VDP"
    billtoInformation.address2 = "test"
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
    amountInformation.total_amount = "2016.05"
    amountInformation.currency = "GBP"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation =CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "586824160825533338"
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    cardInformation.type = "042"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  MaestroInternational.new.main
end