require 'faraday'
require 'pry'

module PaynetApi
  module GetPaymentHistoryReport
    class Request < PaynetApi::BaseRequest
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
        base_url = "#{ENV["BASE_URL"]}get_payment_history_report.asp"
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

      def send!
        Faraday.get(url)
      end

      private

      def alphabetize_by_key(hash)
        hash.sort.to_h
      end

      def to_query(hash)
        hash.reduce(''){|m, (k,v)| v.nil? ? m : m + "#{k}=#{v}&"}.chop
      end

      def to_alphabetized_query(hash)
        to_query( alphabetize_by_key(hash) )
      end
    end
  end
end

        # https://secure.paynetonline.com/search_for_company.asp?user=paynet_direct_test@liftforward.com&password=Che6eqas!&version=0320&company_name=Veto%E2%80%99s+tattoo&City=Nokomis&state_code=TN&phone=5039620554&name_match_threshold=80
        # https://secure.paynetonline.com/search_for_company?city=Durham&company_name=Acme+Co&state_code=NC

        # https://secure.paynetonline.com/get_payment_history_report.asp?user=paynet_direct_test@liftforward.com&password=Che6eqas!&version=0320&paynet_id=59206906&user_field=INVOI CE123&payment_comprehensive=1&business_background=1&public_filings=1&uc c_filings=1&legal_name=1&master_score=1
        # https://secure.paynetonline.com/get_payment_history_report.asp?
        # user=paynet_direct_test@liftforward.com
        # password=Che6eqas!
        # version=0320
        # paynet_id=59206906
        # user_field=INVOI CE123
        # payment_comprehensive=1
        # business_background=1
        # public_filings=1
        # ucc_filings=1&legal_name=1&master_score=1
        #
        #
        # {
        #   user: ENV["BASIC_AUTH_USER"],
        #   password ENV["BASIC_AUTH_PASSWORD"],
        #   version: 0320,
        #   paynet_id
        #   user_field
        #   format
        #   payment_comprehensive
        #   business_background
        #   public_filings
        #   ucc_filings
        #   legal_name
        #   transpo_score
        #   ￼office_score
        #   constr_score
        #   master_score
        #   action
        #   expanded_vars
        # }
