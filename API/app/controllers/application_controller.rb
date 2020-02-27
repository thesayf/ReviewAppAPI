class ApplicationController < ActionController::API

  before_action :set_current_user
  before_action :authorize

  def decode_token(token)
    rsa_private = OpenSSL::PKey::RSA.generate 2048
    rsa_public = rsa_private.public_key
    JWT.decode(token, rsa_public, false, { algorithm: 'RS256' })[0]
  end

  def get_token
    token = params[:_json]
    token == 'null' || token == nil ? nil : token
  end

  def set_current_user
    token = get_token
    if token && token != 'null'
      decoded_token = decode_token(token)
        if
          @current_user = User.find_by(uid: decoded_token["user_id"])
        else
          @current_user = nil
        end
    else 
        @current_user = nil
    end
  end

  def logged_in
    !!@current_user
  end

  def authorize
    
    if !logged_in
        return render json: { error: 'you must be logged in'}, status: :unauthorized
    end
  end
end
