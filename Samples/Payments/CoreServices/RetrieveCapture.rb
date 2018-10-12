require 'cyberSource_client'

public
class GetCapture
  def main
    id = '5289697403596987704107'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::CaptureApi.new(apiClient)
    data, status_code, headers = apiInstance.get_capture(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetCapture.new.main
end
