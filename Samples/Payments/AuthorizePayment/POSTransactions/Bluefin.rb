require 'cyberSource_client'

public
class POSBluefinTransaction
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "demomerchant"
    request.client_reference_information = clientReferenceInformation

    pointOfSaleInformation = CyberSource::V2paymentsPointOfSaleInformation.new
    pointOfSaleInformation.card_present = "Y"
    pointOfSaleInformation.cat_level = 1
    pointOfSaleInformation.entry_mode = "keyed"
    pointOfSaleInformation.terminal_capability = 2
    request.point_of_sale_information = pointOfSaleInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "VDP"
    billtoInformation.address1 = "201 S. Division St."
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.locality = "Ann Arbor"
    billtoInformation.administrative_area = "MI"
    billtoInformation.first_name = "RTS"
    billtoInformation.phone_number = "999999999"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "100.00"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation = CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2050"
    cardInformation.expiration_month = "12"
    cardInformation.number = "372425119311008"
    paymentInformation.card = cardInformation

    fluidDataInformation = CyberSource::V2paymentsPaymentInformationFluidData.new
    fluidDataInformation.descriptor = "Ymx1ZWZpbg=="
    fluidDataInformation.value = "02d700801f3c20008383252a363031312a2a2a2a2a2a2a2a303030395e46444d53202020202020202020202020202020202020202020205e323231322a2a2a2a2a2a2a2a3f2a3b363031312a2a2a2a2a2a2a2a303030393d323231322a2a2a2a2a2a2a2a3f2a7a75ad15d25217290c54b3d9d1c3868602136c68d339d52d98423391f3e631511d548fff08b414feac9ff6c6dede8fb09bae870e4e32f6f462d6a75fa0a178c3bd18d0d3ade21bc7a0ea687a2eef64551751e502d97cb98dc53ea55162cdfa395431323439323830303762994901000001a000731a8003"
    paymentInformation.fluid_data = fluidDataInformation
    
    request.payment_information = paymentInformation
    puts request
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  POSBluefinTransaction.new.main
end
