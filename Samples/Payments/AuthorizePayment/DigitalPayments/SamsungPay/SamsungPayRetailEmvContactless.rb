require 'cyberSource_client'

public
class SamsungPayRetailEmvContactless
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "33557799"
    request.client_reference_information = clientReferenceInformation

    pointOfSaleInformation = CyberSource::V2paymentsPointOfSaleInformation.new
    pointOfSaleInformation.terminal_id = "terminal"
    pointOfSaleInformation.card_present = "Y"
    emvInformation = CyberSource::V2paymentsPointOfSaleInformationEmv.new
    emvInformation.card_sequence_number = "123"
    emvInformation.tags = "9C01019A031207109F33036040209F1A0207849F370482766E409F3602001F82025C009F2608EF7753429A5D16B19F100706010A03A00000950580000400009F02060000000700009F6E0482766E409F5B04123456789F2701809F3403AB12349F0902AB129F4104AB1234AB9F0702AB129F0610123456789012345678901234567890AB9F030200005F2A0207849F7C031234569F350123"
    pointOfSaleInformation.emv = emvInformation
    pointOfSaleInformation.entry_mode = "contactless"
    pointOfSaleInformation.terminal_capability = 4
    request.point_of_sale_information = pointOfSaleInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "retail"
    processingInformation.payment_solution = "008"
    request.processing_information = processingInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
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
    amountInformation.total_amount = "100.00"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    tokenizedCardInformation =CyberSource::V2paymentsPaymentInformationTokenizedCard.new
    tokenizedCardInformation.transaction_type = "1"
    tokenizedCardInformation.requestor_id = "12345678901"
    paymentInformation.tokenized_card = tokenizedCardInformation
    cardInformation = CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.type = "001"
    #track data not present under payment information card model class
    # cardInformation.track_data = ";4111111111111111=21121019761186800000?"
    paymentInformation.card = cardInformation

    request.payment_information = paymentInformation

    puts request
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  SamsungPayRetailEmvContactless.new.main
end
