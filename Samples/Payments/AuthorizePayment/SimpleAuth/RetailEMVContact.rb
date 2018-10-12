require 'cyberSource_client'

public
class RetailEMVContact
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC50171_8"
    request.client_reference_information = clientReferenceInformation

    pointOfSaleInformation = CyberSource::V2paymentsPointOfSaleInformation.new
    pointOfSaleInformation.card_present = "Y"
    pointOfSaleInformation.cat_level = 1
    # pointOfSaleInformation.endlessAisleTransactionIndicator = "true"
    pointOfSaleInformation.entry_mode = "swiped"
    pointOfSaleInformation.terminal_capability = 2
    request.point_of_sale_information = pointOfSaleInformation

    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "retail"
    processingInformation.payment_solution = "011"
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
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "115.00"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    fluidDataInformation = CyberSource::V2paymentsPaymentInformationFluidData.new
    fluidDataInformation.descriptor = "EMV.PAYMENT.AnywhereCommerce.Walker"
    fluidDataInformation.value = "ewogICJkYXRhIiA6ICJOZmNwRURiK1dLdzBnQkpsaTRcL1hlWm1ITzdUSng0bnRoMnc2Mk9ITVJQK3hCRlFPdFE0WWpRcnY0RmFkOHh6VExqT2VFQm5iNHFzeGZMYTNyNXcxVEdXblFGQnNzMWtPYnA0XC95alNtVE1JSGVjbGc5OFROaEhNb0VRcjJkRkFqYVpBTFAxSlBsdVhKSVwvbTZKSmVwNGh3VHRWZE16Z2laSUhnaWFCYzNXZVd1ZnYzc1l0cGRaZDZYZENEUFdLeXFkYjBJdUtkdkpBPT0iLAogICJzaWduYXR1cmUiIDogIkFxck1pKzc0cm1GeVBKVE9HN3NuN2p5K1YxTlpBZUNJVE56TW01N1B5cmc9IiwKICAic2lnbmF0dXJlQWxnSW5mbyIgOiAiSE1BQ3dpdGhTSEEyNTYiLAogICJoZWFkZXIiIDogewogICAgInRyYW5zYWN0aW9uSWQiIDogIjE1MTU2MjI2NjIuMTcyMjIwIiwKICAgICJwdWJsaWNLZXlIYXNoIiA6ICJcLzdmdldqRVhMazJPRWpcL3Z5bk1jeEZvMmRWSTlpRXVoT2Nab0tHQnpGTmM9IiwKICAgICJhcHBsaWNhdGlvbkRhdGEiIDogIkN5YmVyU291cmNlLlZNcG9zS2l0IiwKICAgICJlcGhlbWVyYWxQdWJsaWNLZXkiIDogIk1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMERBUWNEUWdBRW1JN0tScnRNN2NNelk5Zmw2UWt2NEQzdE9jU0NYR1hoOFwvK2R4K2s5c1Zrbk05UFQrOXRqMzk2YWF6QjRcL0hYaWlLRW9DXC9jUzdoSzF6UFk3MVwvN0pUUT09IgogIH0sCiAgInZlcnNpb24iIDogIjEuMCIKfQ=="
    paymentInformation.fluid_data = fluidDataInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
end
  RetailEMVContact.new.main
end
