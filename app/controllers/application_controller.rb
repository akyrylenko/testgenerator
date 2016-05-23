require 'digest/sha1'
require 'securerandom'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Fidelipay methods

  def createSignature(data, key)
	# Hash the signature string and the key together
	Digest::SHA2.new(512).hexdigest(string_from_data(data) + key)
  end
  helper_method :createSignature

  def generate_uuid
  	SecureRandom.uuid
  end
  helper_method :generate_uuid

  def fidelipay_key
    'Custom29Simple14Marker'
  end
  helper_method :fidelipay_key

  def fidelipay_url
  	'https://gateway.fidelipay.co.uk/paymentform/'
  end
  helper_method :fidelipay_url

  def string_from_data(data)
	data.to_query.gsub('%0D%0A', '%0A').gsub('%0A%0D', '%0A').gsub('%0D', '%0A')
  end
  helper_method :string_from_data

end
