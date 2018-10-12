require 'cyberSource_client'

public
class AuthorizeAndroidPayCybersourceDecryption
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC_MPOS_Paymentech_1"
    request.client_reference_information = clientReferenceInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.payment_solution = "006"
    request.processing_information = processingInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "VDP"
    billtoInformation.address1 = "201 S. Division St."
    billtoInformation.postal_code = "48104-2201"
    billtoInformation.first_name = "RTS"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "100.00"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    fluidDataInformation = CyberSource::V2paymentsPaymentInformationFluidData.new
    fluidDataInformation.value = "ewoJInB1YmxpY0tleUhhc2giICAgIDogIlNKU1NSN0Q4VHZxbHBPWmcwMFhWY1pYclI1czJBUTJxYU8rK0VTVnl4clU9IiwKCSJ2ZXJzaW9uIjogIjEuMCIsCgkiZGF0YSIgOiAiZXdvSkltVnVZM0o1Y0hSbFpFMWxjM05oWjJVaU9pQWlSbFZrUjNWQlFWVlpRVWd2VXpreU1rczNXVE5QTm5VclpsWXJlbU5wUjBwamN6SkRPVVJ1Ykd0TlYyZzJZa2hVS3pCd2FsTTJjbkZJTDFoTWVYcGlSVTg1WWtsdkwyUmtUbTEzYVRGblRqbEVZV1Y2Y3pOdlpFNXVValZ0Ykd4MlIzWktNRVpYU0ZKeVRTOVRabVF6TlRZeVlqaFNObFpST1ZwS1ZUTmFNMXBDT0ZSWmFtdGpiWGhVTHpkSWQwaHdVWGgxUmpaT2JXZHNWMmwwVnk5VU0ya3dSVE5QV1dwUkswZGtWbTFZTVVOaVoxbHNlWHBRTVVOSWFrNXdUV3RxVUhvMGVrTlVibUpHTmxGc1pIWkxaVFJvYkhselpuZ3pPVzlwVEU5YVIxcG9SSGhVVDNwU2VXUXhWekl6VVQwOUlpd0tDU0psY0dobGJXVnlZV3hRZFdKc2FXTkxaWGtpT2lBaVRVWnJkMFYzV1VoTGIxcEplbW93UTBGUldVbExiMXBKZW1vd1JFRlJZMFJSWjBGRmJ6RnlUMnBGU2t4SUsxWk1VRGQwUkV4YVdHSnBia2xaWWtjeVYwOXZjMDlDZWs5TVMyVkRiMU5ZVm1KSk9XNTBjWFpHT1dKelRtRlhOWEJYUkRsbFdsUXZXSHBHZURoTGIwdEROVmhOYVRSblZXWkdRMUU5UFNJc0Nna2lkR0ZuSWpvZ0lrVkRkRFZwVW1kM1VscGxMM2hJWlRCSU1rMXJhRUpGTXpSM1dYVXllVFJKZG13ME5uUjRXSFlyVjFFOUlncDkiCn0="
    paymentInformation.fluid_data = fluidDataInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthorizeAndroidPayCybersourceDecryption.new.main
end
