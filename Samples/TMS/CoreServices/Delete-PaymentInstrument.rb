require 'cyberSource_client'

public
class RemovePaymentIdentifier
  def main
    id = '72EC3E658278F10FE05340588D0A86AB'
    profileId = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentInstrumentApi.new(apiClient)
    data, status_code, headers = apiInstance.paymentinstruments_token_id_delete(profileId, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  RemovePaymentIdentifier.new.main
end
