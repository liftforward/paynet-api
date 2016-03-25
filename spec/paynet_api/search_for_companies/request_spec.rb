require 'pry'

describe PaynetApi::SearchForCompany::Request do
  let(:request) { PaynetApi::SearchForCompany::Request.new(company_name: "Acme Co", city: "Durham", state_code: "NC") }
  let(:request_with_options) { PaynetApi::SearchForCompany::Request.new(company_name: "Acme Co", city: "Durham", state_code: "NC", name_match_threshold: "80", phone: "2122234454") }
        let(:request_with_missing_arguments) { PaynetApi::SearchForCompany::Request.new() }

  subject { request }

  describe "#initialize" do
    context "with required params passed in" do
      its (:company_name){ should eq("Acme Co") }
      its (:city){ should eq("Durham") }
      its (:state_code){ should eq("NC") }

      context "with optional arguments" do
        subject { request_with_options }
        its (:name_match_threshold){ should eq("80") }
        its (:phone){ should eq("2122234454") }
      end

      context "without optional arguments" do
        its (:name_match_threshold){ should eq(nil) }
        its (:phone){ should eq(nil) }
      end

    end

    context "without required params passed in" do
      it "raises an argument error" do
        expect{ request_with_missing_arguments }.to raise_error(ArgumentError, "missing keywords: company_name, city, state_code")
      end
    end
  end

  describe "#url" do
    let(:url) { URI.encode("#{ENV["BASE_URL"]}search_for_company.asp?city=#{subject.city}&company_name=#{subject.company_name}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&state_code=#{subject.state_code}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }

    context "with required arguments" do
      it "creates the correct encoded url with params for Paynet" do
        expect(subject.url).to eq(url)
      end
    end

    context "with optional arguments" do
      let(:url_with_options) { URI.encode("#{ENV["BASE_URL"]}search_for_company.asp?city=#{subject.city}&company_name=#{subject.company_name}&name_match_threshold=#{subject.name_match_threshold}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&phone=#{subject.phone}&state_code=#{subject.state_code}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }
      subject { request_with_options }

      it "creates the correct encoded url with params for Paynet" do
        expect(subject.url).to eq(url_with_options)
      end
    end
  end

  describe "#send!" do
    let(:url){ URI.encode("#{ENV["BASE_URL"]}search_for_company.asp?user=#{ENV["BASIC_AUTH_USER"]}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&version=0320&company_name=#{subject.company_name}&city=#{subject.city}&state_code=#{subject.state_code}") }

    it "sends Faraday the url" do
      expect(Faraday).to receive(:get).with(subject.url)
      subject.send!
    end

    it "Successfully connects to Paynet" do
      WebMock.allow_net_connect!
      response = subject.send!
      expect(response.success?).to be true
      expect(response.body).not_to be nil
    end
  end

end
