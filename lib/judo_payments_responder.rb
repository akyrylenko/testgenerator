require 'httparty'

class JudoPaymentsResponder
  include HTTParty
  base_uri 'https://partnerapi.judopay-sandbox.com'

  def initialize(u, p)
    @auth = {:username => u, :password => p}
  end

  # which can be :friends, :user or :public
  # options[:query] can be things like since, since_id, count, etc.
  def webpayments(options={})
    options.merge!({:basic_auth => @auth})
    self.class.post("/webpayments/payments", options)
  end
end