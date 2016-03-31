require 'faraday_middleware'
require 'active_model'

module PaynetApi
  class BaseRequest
    include ActiveModel::Validations

    def base_url
      PaynetApi::Config.base_url
    end

    def send!
      connection = Faraday.new url do |conn|
        conn.response :xml,  :content_type => /\bxml$/
        conn.adapter Faraday.default_adapter
      end

      xml_response = connection.get
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
