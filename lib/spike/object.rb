class Spike
  class Object
    def initialize(hash)
      @attributes = Hash[hash.map { |k, v| [k.to_s, v] }]
    end
  end
end
