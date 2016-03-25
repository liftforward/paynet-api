require 'faraday'
require 'pry'

module PaynetApi
  module SearchForCompany
    class Request < PaynetApi::BaseRequest
      ENDPOINT = "search_for_company.asp"
      attr_accessor :company_name, :city, :state_code, :name_match_threshold, :phone

      def initialize(company_name:, city:, state_code:, name_match_threshold: nil, phone: nil)
        @company_name = company_name
        @city = city
        @state_code = state_code
        @name_match_threshold = name_match_threshold
        @phone = phone
      end

      def url
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
    end
  end
end
