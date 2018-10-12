require 'cyberSource_client'

public
class VoidCredit
  def main
    id = "5336378279036983404106"
    request = CyberSource::VoidCreditPayment.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "12345678"
    request.client_reference_information = clientReferenceInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "test"
    billtoInformation.address1 = "201 S. Division St."
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.locality = "Ann Arbor"
    billtoInformation.administrative_area = "MI"
    billtoInformation.first_name = "test"
    billtoInformation.phone_number = "999999999"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "102.21"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation =CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "5555555555554444"
    cardInformation.expiration_month = "12"
    cardInformation.type = "002"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.void_credit(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidCredit.new.main
end
