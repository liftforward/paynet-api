module PaynetApi
  module SearchForCompany
    class Response < PaynetApi::BaseResponse
      def companies
        companies = parsed_xml.response.companies

        return companies.nil? ? [] : [].push(companies.company).flatten
      end

      def success?
        # parsed_xml.response.has_key? :companies
        parsed_xml.response[:@error_code] == "0"
      end

    end
  end
end
