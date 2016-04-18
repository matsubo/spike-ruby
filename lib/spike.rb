require 'spike/version'
require 'spike/error'
require 'spike/object'
require 'spike/charge'
require 'spike/token'
require 'curb'

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

  def token
    Spike::Token.new(self)
  end

  def get(request_path:, request_params: {})
    require 'active_support/core_ext/object/to_query'

    c = build_curl(request_path + '?' + request_params.to_query)
    basic_auth(c)

    c.http_get

    handle_response(c)
    JSON.parse(c.body_str)
  end

  def post(request_path:, request_params:)
    c = build_curl(request_path)
    basic_auth(c)

    curb_post_fields = request_params.map {|k,v| Curl::PostField.content(k,v)}
    c.http_post(c.url, *curb_post_fields)

    handle_response(c)
    JSON.parse(c.body_str)
  end

  private
  def build_curl(request_path)
    c = Curl::Easy.new
    c.url = API_URL + request_path
    c
  end

  def basic_auth(curl)
    curl.http_auth_types = :basic
    curl.username = @secret_token
    curl.password = ''
  end

  def handle_response(curl)
    case curl.status.to_i
    when 400
      raise Spike::BadRequestError, JSON.parse(curl.body_str)['error']['message']
    when 401
      raise Spike::UnauthorizedError
    when 402
      raise Spike::RequestFailedError
    when 404
      raise Spike::NotFoundError
    when 500
      raise Spike::ApiServerError
    end
  end
end
