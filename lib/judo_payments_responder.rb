require 'httparty'

class JudoPaymentsResponder
  include HTTParty
  debug_output $stdout
  base_uri 'https://partnerapi.judopay-sandbox.com'

  def initialize(u, p)
    @auth = {:username => u, :password => p}
  end

  def webpayments(options={})
    httparty_request_options = {
      headers: {
        'Host' => 'partnerapi.judopay-sandbox.com',
        'Api-Version' => '4.1.0',
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'Cache-Control' => 'no-cache',
        },
      body: options.to_json,
      basic_auth: @auth,
    }
    self.class.post("/webpayments/payments", httparty_request_options)
  end
end