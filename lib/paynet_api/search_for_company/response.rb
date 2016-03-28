module PaynetApi
  module SearchForCompany
    class Response < PaynetApi::BaseResponse
      def companies
        @body["response"]["companies"]["company"] if companies_jsonable
      end

      def companies_jsonable
        @body && @body["response"] && @body["response"]["companies"] && @body["response"]["companies"]["company"]
      end
    end
  end
end
