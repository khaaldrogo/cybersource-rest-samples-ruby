require 'cyberSource_client'

public
class FollowonCredits
  def main
    id = "5347671633526686804001"
    request = CyberSource::RefundCaptureRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::RefundApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC12345"
    request.client_reference_information = clientReferenceInformation

    buyerInformation = CyberSource::V2paymentsBuyerInformation.new
    buyerInformation.merchant_customer_id = "123456abcd"
    request.buyer_information = buyerInformation
    
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
    shippingDetails = CyberSource::V2paymentsOrderInformationShippingDetails.new
    shippingDetails.ship_from_postal_code = "47404"
    orderInformation.shipping_details = shippingDetails
    request.order_information = orderInformation
    
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "test"
    billtoInformation.address2 = "test2credit"
    billtoInformation.address1 = "testcredit"
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.locality = "Ann Arbor"
    billtoInformation.administrative_area = "MI"
    billtoInformation.first_name = "john"
    billtoInformation.phone_number = "999999999"
    billtoInformation.company = "Visa"
    billtoInformation.email = "test2@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    invoicedetails = CyberSource::V2paymentsOrderInformationInvoiceDetails.new
    invoicedetails.purchase_order_date = "20111231"
    invoicedetails.purchase_order_number = "CREDIT US"
    orderInformation.invoice_details = invoicedetails
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "10"
    amountInformation.exchange_rate = "0.5"
    amountInformation.exchange_rate_time_stamp = "2.01304E+13"
    amountInformation.currency = "usd"
    
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    merchantInformation = CyberSource::V2paymentsMerchantInformation.new
    merchantInformation.category_code = 1234
    request.merchant_information = merchantInformation

    data, status_code, headers = apiInstance.refund_capture(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  FollowonCredits.new.main
end
