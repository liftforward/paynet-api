require 'pry'

module PaynetApi
  class Client
    def get_payment_history_report(params)
      response = PaynetApi::GetPaymentHistoryReport::Request.new(params).send!
      PaynetApi::GetPaymentHistoryReport::Response.new(response: response)
    end

    def search_for_company(params)
      response = PaynetApi::SearchForCompany::Request.new(params).send!
      PaynetApi::SearchForCompany::Response.new(response: response)
    end
  end
end
