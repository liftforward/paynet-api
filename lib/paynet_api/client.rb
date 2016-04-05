require 'faraday_middleware'

module PaynetApi
  class Client
    # def get_payment_history_report(params)
    #   request = PaynetApi::GetPaymentHistoryReport::Request.new(params)
    #   response = get(request.url)
    #   PaynetApi::GetPaymentHistoryReport::Response.new(response: response.body)
    # end

    def search_for_company(params)
      request = PaynetApi::SearchForCompany::Request.new(params)
      response = get(request)
      PaynetApi::SearchForCompany::Response.new(response_xml: response.body, request: request)
    end


    private
      def get request
        connection = Faraday.new request.url do |conn|
          conn.adapter Faraday.default_adapter
        end

        connection.get
      end
  end
end
