require 'cyberSource_client'

public
class Visa
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC50171_12"
    request.client_reference_information = clientReferenceInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "internet"
    request.processing_information = processingInformation

    aggregatorInformation = CyberSource::V2paymentsAggregatorInformation.new
    submerchantinformation = CyberSource::V2paymentsAggregatorInformationSubMerchant.new
    submerchantinformation.card_acceptor_id = "1234567890"
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
    
    invoiceDetails = CyberSource::V2paymentsOrderInformationInvoiceDetails.new
    invoiceDetails.purchase_order_number = "LevelII Auth Po"
    orderInformation.invoice_details = invoiceDetails
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "112.00"
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
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  Visa.new.main
end
