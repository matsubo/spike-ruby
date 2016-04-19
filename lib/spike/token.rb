require 'json'

class Spike
  class Token
    def initialize(client)
      @client = client
    end

    def create(params)
      res = @client.post(request_path: '/tokens', request_params: params)
      Spike::Token::Response.new(res)
    end

    def retrieve(token_id)
      res = @client.get(request_path: "/tokens/#{token_id}")
      Spike::Token::Response.new(res)
    end

    class Spike::Token::Response < Spike::Object

      def id
        @attributes['id']
      end

      def live_mode?
        @attributes['livemode']
      end

      def created
        Time.at(@attributes['created'])
      end

      def type
        @attributes['type']
      end

      def currency
        @attributes['currency']
      end

      def source
        @attributes['source']
      end
    end
  end
end
