require 'json'

class Spike
  class Charge
    def initialize(client)
      @client = client
    end

    def create(params, products)
      res = @client.post(request_path: '/charges', request_params: params.merge(products: JSON.generate(products)))
      Spike::Charge::Response.new(res)
    end

    def retrieve(charge_id)
      res = @client.get(request_path: "/charges/#{charge_id}")
      Spike::Charge::Response.new(res)
    end

    def list(params = {})
      res = @client.get(request_path: "/charges", request_params: params)
      Spike::Charge::List.new(res)
    end


    class Spike::Charge::List < Spike::Object

      def object
        @attributes['object']
      end

      def url
        @attributes['url']
      end

      def has_more?
        @attributes['has_more']
      end

      def data
        @attributes['data'].collect { |d| Spike::Charge::Response.new(d) }
      end

    end

    class Spike::Charge::Response < Spike::Object
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
end
