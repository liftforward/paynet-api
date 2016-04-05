module PaynetApi
  module CobrandGetPaymentHistoryReport
    class Request < PaynetApi::ReportRequest
      ENDPOINT = "cobrand_get_payment_history_report.asp"
      FORMAT = "pdf"
    end
  end
end
