require 'pry'

describe PaynetApi::SearchForCompany::Request do
  subject { PaynetApi::SearchForCompany::Request.new(company_name: "Acme Co", city: "Durham", state_code: "NC") }
  # its(:builder) { is_expected.to be_a(Builder::XmlMarkup) }
  # its(:options) { is_expected.to be_a(String) }

  describe "#initialize" do
    context "with required params passed in" do
      its (:company_name){ should eq("Acme Co") }
      its (:city){ should eq("Durham") }
      its (:state_code){ should eq("NC") }

      context "with optional arguments" do
        subject { PaynetApi::SearchForCompany::Request.new(company_name: "Acme Co", city: "Durham", state_code: "NC", name_match_threshold: "80", phone: "2122234454") }
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
        expect{ PaynetApi::SearchForCompany::Request.new() }.to raise_error(ArgumentError, "missing keywords: company_name, city, state_code")
      end
    end

  end

  describe '#wsdl' do
    before { PaynetApi::Config.base_url = ENV["BASE_URL"] }

    it "should be the base url plus /search_for_company" do
      expect(subject.wsdl).to eq("#{ENV["BASE_URL"]}/search_for_company")
    end
  end

  describe '#send' do
    it "sends a GET request to Paynet with the correct URL" do
      stub_request(:get, "#{ENV["BASE_URL"]}search_for_company.asp?user=#{ENV["BASIC_AUTH_USER"]}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&version=0320&company_name=#{subject.company_name}&city=#{subject.city}&state_code=#{subject.state_code}").
               with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
               to_return(:status => 200, :body => "", :headers => {})
      # WebMock.allow_net_connect!
      response = subject.send!
      # binding.pry
      expect(response.success?).to be true
    end
  end

end
