require 'spike/version'
require 'spike/charge'
require 'spike/error'

class Spike
  API_BASE = 'https://api.spike.cc'
  API_VERSION = '/v1'
  API_URL = API_BASE+API_VERSION

  def initialize(secret_token)
    @secret_token = secret_token
  end

  def charge
    Spike::Charge.new(self)
  end

  def post(request_path:, request_params:)
    c = Curl::Easy.new
    c.url = API_URL + request_path
    c.http_auth_types = :basic
    c.username = @secret_token
    c.password = ''
    c.verbose = true

    curb_post_fields = request_params.map {|k,v| Curl::PostField.content(k,v)}
    c.http_post(c.url, *curb_post_fields)

    handle_response(c)
    JSON.parse(c.body_str)
  end

  private

  def handle_response(curl)
    case curl.status.to_i
    when 400
      raise Spike::BadRequestError
    when 401
      raise Spike::UnauthorizedError
    when 402
      raise Spike::RequestFailedError
    when 500
      raise Spike::ApiServerError
    end
  end
end
