module PaynetApi
  class Client
    def cobrand_get_payment_history_report(params)
      request = PaynetApi::CobrandGetPaymentHistoryReport::Request.new(params)
      response = get(request)
      PaynetApi::CobrandGetPaymentHistoryReport::Response.new(response: response, request: request)
    end

    def get_payment_history_report(params)
      request = PaynetApi::GetPaymentHistoryReport::Request.new(params)
      response = get(request)
      PaynetApi::GetPaymentHistoryReport::Response.new(response_xml: response.body, request: request)
    end

    def search_for_company(params)
      request = PaynetApi::SearchForCompany::Request.new(params)
      response = get(request)
      PaynetApi::SearchForCompany::Response.new(response_xml: response.body, request: request)
    end


    private
      def get request
        connection = Faraday.new(request.url, { proxy: request.options[:proxy_url] } ) do |conn|
          conn.adapter Faraday.default_adapter
        end

        connection.get
      end
  end
end
