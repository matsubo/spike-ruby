#
# Charge feature
#
class Spike::Charge
  def initialize(client)
    @client = client
  end

  def create(params, products)
    require 'json'
    res = @client.post(request_path: '/charges', request_params: params.merge(products: JSON.generate(products)))
    Spike::Charge::Response.new(res)
  end

  def retrieve(charge_id)
    res = @client.get(request_path: "/charges/#{charge_id}")
    Response.new(res)
  end

  #
  # Charge object
  #
  class Response
    def initialize(hash)
      @attributes = Hash[hash.map { |k, v| [k.to_s, v] }]
    end

    def id
      @attributes['id']
    end

    def object
      @attributes['object']
    end

    def created_at
      Time.at(@attributes['created'])
    end

    def live_mode?
      @attributes['livemode']
    end

    def paid?
      @attributes['paid']
    end

    def captured?
      @attributes['captured']
    end

    def amount
      @attributes['amount'].to_f
    end

    def currency
      @attributes['currency']
    end

    def refunded?
      @attributes['refunded']
    end

    def amount_refunded
      @attributes['amount_refunded']
    end

    def refunds
      @attributes['refunds']
    end
  end
end
