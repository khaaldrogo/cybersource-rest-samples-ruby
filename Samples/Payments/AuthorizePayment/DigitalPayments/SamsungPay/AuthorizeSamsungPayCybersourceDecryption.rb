require 'cyberSource_client'

public
class AuthorizeSamsungPayCybersourceDecryption
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC_MPOS_Paymentech_3"
    request.client_reference_information = clientReferenceInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "vbv"
    processingInformation.payment_solution = "008"
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
    fluidDataInformation.value = "ewoJInB1YmxpY0tleUhhc2giOiAiaTRYell5MFRnNnkvaEUwV2RrK0dwOHV4aml4U3I0US91MUxNOVd0VTl2az0iLAoJInZlcnNpb24iOiAiMTAwIiwKCSJkYXRhIjogIlpYZHZTa2x0Um5OYWVVazJTVU5LVTFVd1JYaFllbFZwVEVGdlNrbHRWblZaZVVrMlNVTktRazFxVlRKU01FNU9TV2wzUzBOVFNuSmhWMUZwVDJsQmFXRlVVbGxsYkd3MVRVWlNiazV1YTNaaFJWVjNWakpTY2tzd1pIZFBTRlkwWVcxc05GVXpTVEJWVXpreFRWVjRUazlXWkRCV1ZHd3lZWG93YVV4QmIwcEpibEkxWTBOSk5rbERTa3RVTVU1R1NXbDNTME5UU21waFIwWjFZbTFXYzFVeVZtcGtXRXB3WkVoc1JHSXlOVEJhV0dnd1NXcHZaMGxzU2xSUlZqbFJVekJyYVVOdU1DNUdURGxEYTJScFFtOHlTSEExWDJ0Qk5WOUJNM2hJUjFCaFQwZDBSMmRWVVRoWk5UY3dNVjlzUmxSU1IxbFlNRWRpYlV4d05GVnBhM1JSV1Voa09FaHZUR3RrVVUxRFUwVjJNRGhXU0daZlJVUmtSaloyTW5rMmJURkJSRmhCWjAxeE9FaHlNVjlOT1daalpXWXhTMGgzVmpCVlNYSlRlRWN4TUZneVUwMTJVa2xmTURKcU9FVjJVV2gyZWt4dVMzRXhiRWgxTUUxMmVEZHdhV1IzYkU4NVJVdG5iRmRTY2tGTlh5MVlRMmczVW1WaE4wWmxaVU16VW00d1dqQnRUMFpZVEhaUVdESkxlWEJ5ZDFCemFHOWpZemxhTW5rNFJYVmlSVzVaT1Zka1pqazJNRUZtVTJwTGIyOHRXRlphVGxoNk5WVlZiSFZoWW5WdVlrRkNlSEJ1VWpsTlMzZzRaMnhoWjBwT1RHcFdOMjB4YzFCT1RrMVBaa1YzT1hoU1V6RjBkWE5sV2sxNFdURnRiRFJDVVVSb1IwWTROa1ZXU0hkUmFXbGpWRGhDYmxkVVVFRlBZVk5uWVVwWk1tVndjMTluVDI5aVptY3VZazFaZVdKSE5EVlFRblJNVG14TVUxOUxiRzVOUVM1Mk1tUmZkVmN5T0c5T1JqUnVUV2xPWTBOeVdWSktlSEJ6YlhJd09XZHRiM0ZSUkZkVk5FRldTMFJ6Wm5VNVltdENTRVJuTnpGclNHaGtNMDV6UTJselpXSmlia2swWVUxWE1sTkxNV054UzNCWVgwaFBNRGswU0hoeVZHeEtUV3gwY21kS2VIWjJMWGd4VVU5eVlXNUNTMnRxY0hsNlpVcDNabWRXWXkxblJ6SktPV2d4U25jMFdIRm1Nbk5ZZFZwbWQzSnJSM0pZTjAxcWFXTnRhVWxuZERGU1lURjZkRGRUYUVvemRucFlSRm81V2paTFUyaDFZWEF6TkZFd05VcERaRUpVTUhseFdqZHVaM2hwWjJ4c2EzbDFWazFRWXpkbWRpMUJkMWhzYkRoc2FtUm9la3BsYmxKdFR6ZEhVRnBtY0dsRlVUWkNTVjl2WWpWTmJERllTRlZHWXpSUFRXZG5TR3hOUW0xWFRqWkxhVVJFUldsUlIyaERaVlZpWW01MmJXTXVMVlZhVUVoME4zUkVPVGRmWVdONFgyRk5SakptUVE9PSIKfQ=="
    paymentInformation.fluid_data = fluidDataInformation

    request.payment_information = paymentInformation
    
    puts request
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthorizeSamsungPayCybersourceDecryption.new.main
end
