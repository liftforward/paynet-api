module PaynetApi
  module CobrandGetPaymentHistoryReport
    class Response
      attr_reader :status, :request, :pdf, :content_type

      def initialize(response:, request:)
        @pdf = response.body
        @status = response.status
        @request = request
        @content_type = response.headers["content-type"]
      end

      def success?
        @content_type == "application/pdf"
      end
    end
  end
end
