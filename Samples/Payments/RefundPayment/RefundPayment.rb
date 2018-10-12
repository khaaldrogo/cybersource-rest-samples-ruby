require 'cyberSource_client'

public
class RefundPayment
  def main
    id = "5337974231586422201013"
    request = CyberSource::RefundPaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::RefundApi.new(apiClient)

    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.capture = "true"
    request.processing_information = processingInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    lineItemsInformation = CyberSource::V2paymentsOrderInformationLineItems.new
    lineItemsInformation.unit_price = "100.00"
    lineItemsInformation.discount_rate = "0.013"
    lineItemsInformation.quantity = 2
    lineItemsInformation.unit_of_measure =" inch"
    lineItemsInformation.discount_amount = "10"
    lineItemsInformation.tax_applied_after_discount = "8"
    lineItemsInformation.amount_includes_tax = "y"
    lineItemsInformation.discount_applied = "y"
    lineItemsInformation.product_name = "PName0"
    lineItemsInformation.tax_rate = "0.082"
    lineItemsInformation.total_amount ="1100"
    lineItemsInformation.product_sku = "testdl"
    lineItemsInformation.product_code = "clothing"
    lineItemsInformation.commodity_code ="987654321012"
    lineItemsInformation.tax_amount = "20.00"
    orderInformation.line_items = lineItemsInformation
    request.order_information = orderInformation

    shippingDetails = CyberSource::V2paymentsOrderInformationShippingDetails.new
    shippingDetails.ship_from_postal_code = "47404"
    orderInformation.shipping_details = shippingDetails
    request.order_information = orderInformation
    
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "test"
    billtoInformation.address2 = "test2"
    billtoInformation.address1 = "test"
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.locality = "Ann Arbor"
    billtoInformation.administrative_area = "MI"
    billtoInformation.first_name = "john"
    billtoInformation.phone_number = "999999999"
    billtoInformation.company = "Visa"
    billtoInformation.email = "test2@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "100"
    amountInformation.exchange_rate = "0.5"
    amountInformation.exchange_rate_time_stamp = "2.01304E+13"
    amountInformation.currency = "usd"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    shipToInformation = CyberSource::V2paymentsOrderInformationShipTo.new
    shipToInformation.country = "US"
    shipToInformation.address2 = "test2"
    shipToInformation.address1 = "test"
    shipToInformation.postal_code = "48104-2202"
    shipToInformation.administrative_area = "MI"
    orderInformation.ship_to = shipToInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation =CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "5555555555554444"
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    cardInformation.type = "002"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.refund_payment(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  RefundPayment.new.main
end
