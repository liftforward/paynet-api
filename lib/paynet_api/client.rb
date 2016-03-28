require 'pry'

module PaynetApi
  class Client

    def search_for_company(params)
      response = PaynetApi::SearchForCompany::Request.new(params).send!
      PaynetApi::SearchForCompany::Response.new(response: response)
    end
  end
end
