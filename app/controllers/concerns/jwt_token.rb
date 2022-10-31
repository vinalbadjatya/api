require "jwt"
module JwtToken
  extend ActiveSupport::Concern
  SECRET_KEY = "yourkey"
	def jwt_encode(payload, exp: 1.days.from_now)
		payload[:exp] = exp.to_i
		jwt_encode(payload,  SECRET_KEY)
	end 

	def jwt_decode(token)
		decoded = jwt.decode(token, SECRET_KEY)[0]
		HashWithInDifferentAccess.new decoded
	end
end
