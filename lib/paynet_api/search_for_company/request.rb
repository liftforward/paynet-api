require 'faraday'
require 'pry'

module PaynetApi
  module SearchForCompany
    class Request < PaynetApi::BaseRequest
      attr_accessor :company_name, :city, :state_code, :name_match_threshold, :phone

      def initialize(company_name:, city:, state_code:, name_match_threshold: nil, phone: nil)
        @company_name = company_name
        @city = city
        @state_code = state_code
        @name_match_threshold = name_match_threshold
        @phone = phone
      end

      def url
        base_url = "#{ENV["BASE_URL"]}search_for_company.asp"
        params = to_alphabetized_query({ user: ENV["BASIC_AUTH_USER"],
                  password: ENV["BASIC_AUTH_PASSWORD"],
                  version: '0320',
                  company_name: company_name,
                  city: city,
                  state_code: state_code,
                  phone: phone,
                  name_match_threshold: name_match_threshold})

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
