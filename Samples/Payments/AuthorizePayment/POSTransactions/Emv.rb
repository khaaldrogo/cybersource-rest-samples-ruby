require 'cyberSource_client'

public
class POSEmvTransaction
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "123456"
    request.client_reference_information = clientReferenceInformation

    pointOfSaleInformation = CyberSource::V2paymentsPointOfSaleInformation.new
    pointOfSaleInformation.card_present = "Y"
    pointOfSaleInformation.cat_level = 2
    emvInformation = CyberSource::V2paymentsPointOfSaleInformationEmv.new
    emvInformation.fallback_condition = "swiped"
    emvInformation.fallback = "Y"
    pointOfSaleInformation.emv = emvInformation
    pointOfSaleInformation.terminal_capability = 4
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
    amountInformation.currency = "usd"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation = CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "372425119311008"
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    
    fluidDataInformation = CyberSource::V2paymentsPaymentInformationFluidData.new
    fluidDataInformation.value = "%B373235387881007^SMITH/JOHN         ^31121019761100      00868000000?;373235387881007=31121019761186800000?"
    paymentInformation.fluid_data = fluidDataInformation
    request.payment_information = paymentInformation
    
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  POSEmvTransaction.new.main
end
