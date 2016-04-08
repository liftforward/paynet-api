module PaynetApi
  module SearchForCompany
    class Response < PaynetApi::BaseResponse
      def companies
        companies = parsed_xml.response.companies

        return companies.nil? ? [] : [].push(companies.company).flatten
      end
    end
  end
end
