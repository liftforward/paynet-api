module PaynetApi
  module SearchForCompany
    class Request < PaynetApi::BaseRequest

      def wsdl
        "#{base_url}/get_payment_history_report"
      end

      def initialize
      end

      def as_xml
      end
    end
  end
end
