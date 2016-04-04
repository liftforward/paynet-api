module PaynetApi
  module SearchForCompany
    class Response < PaynetApi::BaseResponse
      def companies
        companies = parsed_xml.response.companies

        if companies.nil?
          []
        else
          companies.company
        end
      end

      def success?
        # parsed_xml.response.has_key? :companies
        parsed_xml.response[:@error_code] == "0"
      end

    end
  end
end
