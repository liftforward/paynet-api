require 'pry'

describe PaynetApi::SearchForCompany::Request do
  let(:request) { PaynetApi::SearchForCompany::Request.new(company_name: "Acme Co", city: "Durham", state_code: "NC") }
  let(:request_with_options) { PaynetApi::SearchForCompany::Request.new(
    company_name: "Acme Co",
    city: "Durham", state_code: "NC",
    company_name_alias: "Fake Acme",
    address: "80 W 12th St New York, NY 10004",
    name_match_threshold: "80",
    phone: "2122234454",
    tax_id: "123")
  }
  let(:request_with_missing_arguments) { PaynetApi::SearchForCompany::Request.new() }

  subject { request }

  describe "#initialize" do
    context "with required params passed in" do
      its (:company_name){ should eq("Acme Co") }
      its (:city){ should eq("Durham") }
      its (:state_code){ should eq("NC") }

      context "with optional arguments" do
        subject { request_with_options }
        its (:address){ should eq("80 W 12th St New York, NY 10004") }
        its (:company_name_alias){ should eq("Fake Acme") }
        its (:name_match_threshold){ should eq("80") }
        its (:phone){ should eq("2122234454") }
        its (:tax_id){ should eq("123") }
      end

      context "without optional arguments" do
        its (:name_match_threshold){ should eq(nil) }
        its (:phone){ should eq(nil) }
      end
    end

    describe "#tax_id" do
      context "when included" do
        it "is exactly 9 characters when passed in" do
          subject.tax_id = "short"
          expect(subject).to have_error_for(:tax_id, "Tax is the wrong length (should be 9 characters)")
        end

        it "only contains numbers" do
          subject.tax_id = "notnumbers"
          expect(subject).to have_error_for(:tax_id, "Tax is not a number")
        end

        it "can be passed in as a string" do
          subject.tax_id = "123456789"
          expect(subject).to be_valid
        end

        it "can be passed in as a number" do
          subject.tax_id = 123456789
          expect(subject).to be_valid
        end
      end

      context "when not included" do
        it "is valid" do
          subject.tax_id = nil
          expect(subject).to be_valid
        end
      end
    end

    context "without required params passed in" do
      it "raises an argument error" do
        expect{ request_with_missing_arguments }.to raise_error(ArgumentError, "missing keywords: city, company_name, state_code")
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
      let(:url_with_options) { URI.encode("#{ENV["BASE_URL"]}search_for_company.asp?address=80 W 12th St New York, NY 10004&alias=Fake Acme&city=#{subject.city}&company_name=#{subject.company_name}&name_match_threshold=#{subject.name_match_threshold}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&phone=#{subject.phone}&state_code=#{subject.state_code}&tax_id=123&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }
      subject { request_with_options }

      it "creates the correct encoded url with params for Paynet" do
        expect(subject.url).to eq(url_with_options)
      end
    end
  end

  describe "#send!" do
    let(:url){ URI.encode("#{ENV["BASE_URL"]}search_for_company.asp?user=#{ENV["BASIC_AUTH_USER"]}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&version=0320&company_name=#{subject.company_name}&city=#{subject.city}&state_code=#{subject.state_code}") }
    let(:faraday_connection_double) { instance_double(Faraday::Connection, :get => "faraday response")}

    it "sends Faraday the url" do
      expect(Faraday).to receive(:new).with(subject.url).and_return(faraday_connection_double)
      expect(faraday_connection_double).to receive(:get)
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
