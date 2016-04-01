require 'faraday'
require 'pry'

module PaynetApi
  module SearchForCompany
    class Request < PaynetApi::BaseRequest
      validates :tax_id, length: { is: 9 }, allow_nil: true, numericality: { only_integer: true }

      ENDPOINT = "search_for_company.asp"
      attr_accessor :address, :city, :company_name, :company_name_alias, :name_match_threshold, :phone, :state_code, :tax_id

      def initialize(address: nil, city:, company_name:, company_name_alias: nil, name_match_threshold: nil, phone: nil, state_code:, tax_id: nil)
        @address = address
        @city = city
        @company_name = company_name
        @company_name_alias = company_name_alias
        @name_match_threshold = name_match_threshold
        @phone = phone
        @state_code = state_code
        @tax_id = tax_id
      end

      def path
        to_alphabetized_query(
          { user: PaynetApi::Config.basic_auth_user,
            address: address,
            alias: company_name_alias,
            city: city,
            company_name: company_name,
            password: PaynetApi::Config.basic_auth_password,
            phone: phone,
            name_match_threshold: name_match_threshold,
            state_code: state_code,
            tax_id: tax_id,
            version: '0320'
          }
        )
      end
    end
  end
end
