module PaynetApi
  class Config
    class << self
      attr_accessor :base_url,
                    :basic_auth_user,
                    :basic_auth_password,
                    :proxy_url,
                    :log,
                    :log_level
    end
    
    def self.logger
      @logger ||= Logger.new($stdout)
    end

    def self.logger= logger
      @logger=logger
    end
  end
end
