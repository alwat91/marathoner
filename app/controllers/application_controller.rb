class ApplicationController < ActionController::API
  def authenticate
    # Check to see if the token is valid. Render unauthorized if it isn't valid.
    render json: {status: 401, message: "unauthorized"} unless decode_token(bearer_token)
  end

  def authorize
    # Check to see if the current user id equals the request user id, and renders unauthorized if they don't match.
    render json: {status: 401, message: "unauthorized"} unless current_user.id == params[:id].to_i || current_user.id == params[:user_id].to_i
  end

  def bearer_token
    # Regular expression for finding token
    pattern = /^Bearer /
    # Retrieve header containing token
    header  = request.env["HTTP_AUTHORIZATION"] # <= env
    # Remove "Bearer " from token if the header exists and matches the pattern
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def current_user
    # True if bearer_token returns false
    return if !bearer_token
    # Decode the bearer token
    decoded_jwt = decode_token(bearer_token)
    # Returns curent user if it exists. If it doesn't, it sets it equal to and returns the user matching the user in the decoded token
    @current_user ||= User.find(decoded_jwt["user"]["id"])
  end

  def decode_token(token)
    # Returns token if it exists. If it doesn't, it sets it equal to and returns the decoded token.
    @token ||= JWT.decode(token, nil, false)[0] # this will error if the token is invalid or expired
    # Renders error if invalid or expired.
  rescue
    render json: {status: 401, message: 'invalid or expired token'}
  end
end
