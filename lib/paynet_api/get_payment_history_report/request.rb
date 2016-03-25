require 'faraday'
require 'pry'

module PaynetApi
  module GetPaymentHistoryReport
    class Request < PaynetApi::BaseRequest
      ENDPOINT = "get_payment_history_report.asp"
      attr_accessor :paynet_id, :payment_comprehensive, :business_background, :public_filings, :ucc_filings, :legal_name, :transpo_score, :office_score, :constr_score, :master_score, :expanded_vars

      def initialize(paynet_id:, payment_comprehensive: nil, business_background: nil, public_filings: nil, ucc_filings: nil, legal_name: nil, transpo_score: nil, office_score: nil, constr_score: nil, master_score: nil, expanded_vars: nil)
        @paynet_id = paynet_id
        @payment_comprehensive = payment_comprehensive
        @business_background = business_background
        @public_filings = public_filings
        @ucc_filings = ucc_filings
        @legal_name = legal_name
        @transpo_score = transpo_score
        @office_score = office_score
        @constr_score = constr_score
        @master_score = master_score
        @expanded_vars = expanded_vars
      end

      def url
        params = to_alphabetized_query({ user: ENV["BASIC_AUTH_USER"],
                  password: ENV["BASIC_AUTH_PASSWORD"],
                  version: '0320',
                  paynet_id: paynet_id,
                  payment_comprehensive: payment_comprehensive,
                  business_background: business_background,
                  public_filings: public_filings,
                  ucc_filings: ucc_filings,
                  legal_name: legal_name,
                  transpo_score: transpo_score,
                  office_score: office_score,
                  constr_score: constr_score,
                  master_score: master_score,
                  expanded_vars: expanded_vars})

        URI.encode("#{base_url}?#{params}")
      end
    end
  end
end
