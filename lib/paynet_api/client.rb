module PaynetApi
  class Client
    attr_accessor :logger

    def initialize options = {}
      configure_defaults
    end

    def configure_defaults
      self.logger=PaynetApi::Config.logger
    end

  end
end
