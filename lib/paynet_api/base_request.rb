require 'active_model'

module PaynetApi
  class BaseRequest
    include ActiveModel::Validations

    def options
      @options ||= {
        basic_auth_user: PaynetApi::Config.basic_auth_user,
        basic_auth_password: PaynetApi::Config.basic_auth_password,
        base_url: PaynetApi::Config.base_url,
        proxy_url: PaynetApi::Config.proxy_url
      }
    end

    def user
      options[:basic_auth_user]
    end

    def password
      options[:basic_auth_password]
    end

    def base_url
      options[:base_url]
    end

    def proxy_url
      options[:proxy_url]
    end

    def url
      URI.encode("#{base_url}#{self.class::ENDPOINT}?#{query}")
    end

    def auth_attributes
      {
        user: user,
        password: password,
        version: '0320'
      }
    end

    def query
      to_alphabetized_query auth_attributes.merge(params)
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
