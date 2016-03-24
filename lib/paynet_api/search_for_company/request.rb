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


      def send!
        conn = Faraday.new(:url => ENV["BASE_URL"]) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          # faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end

        response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
          req.url 'search_for_company.asp'
          req.params['user'] = ENV["BASIC_AUTH_USER"]
          req.params['password'] = ENV["BASIC_AUTH_PASSWORD"]
          req.params['version'] = '0320'
          req.params['company_name'] = company_name
          req.params['city'] = city
          req.params['state_code'] = state_code
          req.params['phone'] = phone if phone
          req.params['name_match_threshold'] = name_match_threshold if name_match_threshold
        end

# binding.pry
# https://secure.paynetonline.com/search_for_company.asp?user=paynet_direct_test@liftforward.com&password=Che6eqas!&version=0320&company_name=Veto%E2%80%99s+tattoo&City=Nokomis&state_code=TN&phone=5039620554&name_match_threshold=80
#
# https://secure.paynetonline.com/search_for_company.asp?
# user=paynet_direct_test@liftforward.com
# password=Che6eqas!
# version=0320
# company_name=Veto%E2%80%99s+tattoo
# City=Nokomis
# state_code=TN
# phone=5039620554
# name_match_threshold=80
#
# {
#   user: ENV["BASIC_AUTH_USER"],
#   password: ENV["BASIC_AUTH_PASSWORD"],
#   version: 0320
#   company_name: Veto%E2%80%99s+tattoo
#   city: Nokomis
#   state_code: TN
#   phone: 5039620554
#   name_match_threshold: 80
# }
#
# https://secure.paynetonline.com/search_for_company?city=Durham&company_name=Acme+Co&state_code=NC
#
#
#
#
#
#
# https://secure.paynetonline.com/get_payment_history_report.asp?user=paynet_direct_test@liftforward.com&password=Che6eqas!&version=0320&paynet_id=59206906&user_field=INVOI CE123&payment_comprehensive=1&business_background=1&public_filings=1&uc c_filings=1&legal_name=1&master_score=1
#
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


      end
    end
  end
end
