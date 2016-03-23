module PaynetApi
  class Client
    attr_accessor :savon_options, :logger

    def initialize options = {}
      configure_defaults
      self.savon_options.merge(options)
    end

    def configure_defaults
      self.logger=PaynetApi::Config.logger
      self.savon_options= {
        soap_version: 2,
        basic_auth: [PaynetApi::Config.basic_auth_user, PaynetApi::Config.basic_auth_password],
        proxy: PaynetApi::Config.proxy_url,
        log_level: PaynetApi::Config.log_level,
        log: PaynetApi::Config.log,
        pretty_print_xml: true,
        logger: PaynetApi::Config.logger
      }
    end

    def client wsdl
      Savon.client(savon_options.merge({wsdl: wsdl}))
    end

    def echo_test request
      savon_response = self.client(request.wsdl).call(:echo_test, message: request.as_xml)
      PaynetApi::EchoTest::Response.new(savon_response.to_s, request.as_xml)
    end

    def bps_report request
      savon_response = self.client(request.wsdl).call(:bps_report, message: request.as_xml)
      PaynetApi::BpsReport::Response.new(savon_response.to_s, request.as_xml)
    end

  end
end
