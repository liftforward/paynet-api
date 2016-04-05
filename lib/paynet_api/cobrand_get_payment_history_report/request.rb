module PaynetApi
  module CobrandGetPaymentHistoryReport
    class Request < PaynetApi::ReportRequest
      ENDPOINT = "cobrand_get_payment_history_report.asp"

      def format
        "pdf"
      end
    end
  end
end
