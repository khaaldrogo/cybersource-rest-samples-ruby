require 'cyberSource_client'

public
class Generatekey
  def main
    request = CyberSource::KeyParameters.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::KeyGenerationApi.new(apiClient)
    request.encryption_type = "RsaOaep256"

    data, status_code, headers = apiInstance.generate_public_key(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  Generatekey.new.main
end