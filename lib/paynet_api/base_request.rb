require 'faraday_middleware'

module PaynetApi
  class BaseRequest

    def base_url
      # PaynetApi::Config.base_url
      "#{ENV["BASE_URL"]}#{self.class::ENDPOINT}"
    end

    def send!
      # Faraday.get(url)
      connection = Faraday.new url do |conn|
        conn.response :xml,  :content_type => /\bxml$/
        # conn.response :json, :content_type => /\bjson$/

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
