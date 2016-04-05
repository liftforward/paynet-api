describe PaynetApi::BaseRequest do
  let(:request) { PaynetApi::BaseRequest.new }

  subject{ request }

  describe "#url" do
    before do
      allow(subject).to receive(:path).and_return("path")
      stub_const("PaynetApi::BaseRequest::ENDPOINT", "endpoint")
    end

    it "creates the correct encoded url with params for Paynet" do
      expect(subject.url).to eq(URI.encode("#{ENV["BASE_URL"]}endpoint?path"))
    end
  end
end
