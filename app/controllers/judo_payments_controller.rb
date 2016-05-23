class JudoPaymentsController < ApplicationController
  def index
  end

  def checkout
    judo_payment_responder = JudoPaymentsResponder.new(judo_token, judo_secret)
    
    payment_options = {
	    judoId: judo_id,
	    amount: 125.00,
	    currency: "GBP",
	    yourConsumerReference: "example_customer_reference_00001",
	    yourPaymentReference: "example_payment_reference_00001",
	    yourPaymentMetaData: { 
		    invoiceNumber: "000546" , 
		    customerNumber: "ABC123456" 
	    },
	    clientIpAddress: "127.0.0.1",
	    clientUserAgent: "example browser 5.25"
    }

    judo_response = judo_payment_responder.webpayments(payment_options)

    Rails.logger.info("JUDO response:" + judo_response.inspect)

    pp("JUDO response:" + judo_response.inspect)
  	@postUrl = judo_response['postUrl']
  	@referenceID = judo_response['reference']
  end

  def success
  end

  def failure
  end

  # Judo pay methods

  def judo_id
  	'100149-012'
  end

  def judo_token
  	'7sgyl3cDWR2PNBrM'
  end
  helper_method :judo_token

  def judo_secret
  	'991315ea553a29fb654ee094a239d84b122f8749523b1948ae1c46783be54736'
  end
  helper_method :judo_secret
end
