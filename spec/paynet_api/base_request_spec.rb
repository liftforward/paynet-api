describe PaynetApi::BaseRequest do
  let(:request) { PaynetApi::BaseRequest.new }

  subject{ request }

  describe "#query" do
    before do
      allow(subject).to receive(:params).and_return({version: "0123", alpha: "alpha"})
      stub_const("PaynetApi::BaseRequest::ENDPOINT", "endpoint")
    end

    context "with required arguments" do
      it "creates the correct encoded path with params for Paynet" do
        expect(subject.query).to eq(URI.encode("alpha=alpha&password=#{ENV["BASIC_AUTH_PASSWORD"]}&user=#{ENV["BASIC_AUTH_USER"]}&version=0123"))
      end
    end
  end

  describe "#url" do
    before do
      allow(subject).to receive(:query).and_return("query")
      stub_const("PaynetApi::BaseRequest::ENDPOINT", "endpoint")
    end

    it "creates the correct encoded url with params for Paynet" do
      expect(subject.url).to eq(URI.encode("#{ENV["BASE_URL"]}endpoint?query"))
    end
  end

  describe "#options" do
    it "contains the default options set in PaynetApi::Config" do
      expect(subject.options[:base_url]).to eq(PaynetApi::Config.base_url)
      expect(subject.options[:basic_auth_user]).to eq(PaynetApi::Config.basic_auth_user)
      expect(subject.options[:basic_auth_password]).to eq(PaynetApi::Config.basic_auth_password)
    end
  end

  describe "#user" do
    it "is expected to return default user" do
      expect(subject.user).to eq(PaynetApi::Config.basic_auth_user)
    end
  end

  describe "#password" do
    it "is expected to return default password" do
      expect(subject.password).to eq(PaynetApi::Config.basic_auth_password)
    end
  end

  describe "#base_url" do
    it "is expected to return default base_url" do
      expect(subject.base_url).to eq(PaynetApi::Config.base_url)
    end
  end

end
