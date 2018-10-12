require 'cyberSource_client'

public
class VisaBillPayment
  def main
    id = "5347606988036701504006"
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::CaptureApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "1234567890"
    request.client_reference_information = clientReferenceInformation

    pointOfSaleInformation = CyberSource::V2paymentsPointOfSaleInformation.new
    pointOfSaleInformation.card_present = "false"
    pointOfSaleInformation.cat_level = 6
    pointOfSaleInformation.terminal_capability = 4
    request.point_of_sale_information = pointOfSaleInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "VDP"
    billtoInformation.address1 = "901 Metro Center Blvd"
    billtoInformation.postal_code = "40500"
    billtoInformation.locality = "Foster City"
    billtoInformation.administrative_area = "CA"
    billtoInformation.first_name = "RTS"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "100.00"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    data, status_code, headers = apiInstance.capture_payment(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VisaBillPayment.new.main
end