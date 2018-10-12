require 'cyberSource_client'

public
class ServiceFees
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC50171_3"
    request.client_reference_information = clientReferenceInformation

    aggregatorInformation = CyberSource::V2paymentsAggregatorInformation.new
    submerchantinformation = CyberSource::V2paymentsAggregatorInformationSubMerchant.new
    submerchantinformation.country = "US"
    submerchantinformation.phone_number = "650-432-0000"
    submerchantinformation.address1 = "900 Metro Center"
    submerchantinformation.postal_code = "94404-2775"
    submerchantinformation.locality = "Foster City"
    submerchantinformation.name = "Visa Inc"
    submerchantinformation.administrative_area = "CA"
    submerchantinformation.region = "PEN"
    submerchantinformation.email = "test@cybs.com"
    aggregatorInformation.sub_merchant = submerchantinformation
    aggregatorInformation.name = "V-Internatio"
    aggregatorInformation.aggregator_id = "123456789"
    request.aggregator_information = aggregatorInformation
    
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
    # amountInformation.service_fee_amount = "30.0"
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

    merchantInformation = CyberSource::V2paymentsMerchantInformation.new
    merchantDescriptor = CyberSource::V2paymentsMerchantInformationMerchantDescriptor.new
    merchantDescriptor.name = "ABC"
    merchantDescriptor.contact = "12345"
    # merchantDescriptor.state = "TEXAS"
    merchantInformation.merchant_descriptor = merchantDescriptor
    request.merchant_information = merchantInformation

    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  ServiceFees.new.main
end