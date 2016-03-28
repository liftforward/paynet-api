module PaynetApi
  class BaseResponse
    attr_reader :body, :status

    def initialize(response:)
      @body = response.body
      @status = response.status
      @success = response.success?
    end

    def success?
      @success
    end

    def error_code
      @body["response"]["error_code"] if @body && @body["response"] && @body["response"]["error_code"]
    end

    def version
      @body["response"]["version"] if @body && @body["response"] && @body["response"]["version"]
    end

    def companies
      @body["response"]["companies"]["company"] if companies_jsonable
    end

    def companies_jsonable
      @body && @body["response"] && @body["response"]["companies"] && @body["response"]["companies"]["company"]
    end
  end
end
