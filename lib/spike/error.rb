class Spike
  class BadRequestError < StandardError; end
  class UnauthorizedError < StandardError; end
  class RequestFailedError < StandardError; end
  class NotFoundError < StandardError; end
  class ApiServerError < StandardError; end
end
