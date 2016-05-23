require 'httparty'

class JudoPaymentsResponder
  include HTTParty
  base_uri 'https://partnerapi.judopay-sandbox.com'

  def initialize(u, p)
    @auth = {:username => u, :password => p}
  end

  def webpayments(options={})
    options.merge!({
      headers: {
        'Api-Version' => '4.1.0',
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        },
      basic_auth: @auth
    })
    self.class.post("/webpayments/payments", options)
  end
end