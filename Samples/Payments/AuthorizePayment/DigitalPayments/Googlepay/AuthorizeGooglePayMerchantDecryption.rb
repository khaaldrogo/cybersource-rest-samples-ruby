require 'cyberSource_client'

public
class AuthorizeGooglePayMerchantDecryption
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "mpos_paymentech"
    request.client_reference_information = clientReferenceInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.payment_solution = "012"
    request.processing_information = processingInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "VDP"
    billtoInformation.address2 = "Desk M3-5573"
    billtoInformation.address1 = "201 S. Division St."
    billtoInformation.postal_code = "94404"
    billtoInformation.locality = "Foster City"
    billtoInformation.administrative_area = "CA"
    billtoInformation.first_name = "RTS"
    billtoInformation.district = "MI"
    billtoInformation.company = "Visa"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "2012"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation =CyberSource::V2paymentsPaymentInformationTokenizedCard.new
    cardInformation.expiration_year = "2020"
    cardInformation.number = "4111111111111111"
    cardInformation.expiration_month = "12"
    cardInformation.transaction_type = "1"
    cardInformation.cryptogram = "EHuWW9PiBkWvqE5juRwDzAUFBAk="
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    puts request
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthorizeGooglePayMerchantDecryption.new.main
end
