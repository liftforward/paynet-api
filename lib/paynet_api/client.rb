module PaynetApi
  class Client
    # def get_payment_history_report(params)
    #   request = PaynetApi::GetPaymentHistoryReport::Request.new(params)

    #   response = get(request.url)

    #   PaynetApi::GetPaymentHistoryReport::Response.new(response: response.body)
    # end

    def search_for_company(params)
      request = PaynetApi::SearchForCompany::Request.new(params)

      response = get(request.url)

      PaynetApi::SearchForCompany::Response.new(response_xml: response.body, request: request)
    end


    private
      def get url

        connection = Faraday.new url do |conn|
          # conn.response :xml,  :content_type => /\bxml$/
          conn.adapter Faraday.default_adapter
        end

        connection.get
      end
  end
end
