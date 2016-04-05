module PaynetApi
  module SearchForCompany
    class Request < PaynetApi::BaseRequest
      ENDPOINT = "search_for_company.asp"
      attr_accessor :address, :city, :company_name, :company_name_alias, :name_match_threshold, :phone, :state_code, :postal_code, :tax_id
      validates :tax_id, length: { is: 9 }, allow_nil: true, numericality: { only_integer: true }

      def initialize(address: nil, city:, company_name:, company_name_alias: nil, name_match_threshold: nil, phone: nil, state_code:, postal_code: nil, tax_id: nil, opts: {})
        @address = address
        @city = city
        @company_name = company_name
        @company_name_alias = company_name_alias
        @name_match_threshold = name_match_threshold
        @phone = phone
        @state_code = state_code
        @tax_id = tax_id
        @postal_code = postal_code
        options.merge!(opts)
      end

      def params
        {
          address: address,
          alias: company_name_alias,
          city: city,
          company_name: company_name,
          phone: phone,
          name_match_threshold: name_match_threshold,
          state_code: state_code,
          postal_code: postal_code,
          tax_id: tax_id,
          version: '0320'
        }
      end
    end
  end
end
