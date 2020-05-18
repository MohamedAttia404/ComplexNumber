##For authenticating the user and generating a token for him/her using encode.
##To check if the user's token appended in each request is correct by using decode.

class JsonWebToken
    class << self
        def encode(payload, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end
        
        def decode(token)
            body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
            HashWithIndifferentAccess.new body
        rescue #handling exceptions
            nil
        end
    end
end