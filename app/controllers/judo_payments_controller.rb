class JudoPaymentsController < ApplicationController
  def index
  end

  def success
  end

  def failure
  end

  # Judo pay methods

  def judo_token
  	'7sgyl3cDWR2PNBrM'
  end
  helper_method :judo_token

  def judo_secret
  	'991315ea553a29fb654ee094a239d84b122f8749523b1948ae1c46783be54736'
  end
  helper_method :judo_secret

end
