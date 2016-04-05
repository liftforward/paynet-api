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

  describe ".ENDPOINT" do
    it "equals search_for_company.asp" do
      expect(PaynetApi::SearchForCompany::Request::ENDPOINT).to eq("search_for_company.asp")
    end
  end

  describe "#options" do
    context "no options parameters supplied" do
      subject { request_with_options }

      it "contains the default options set in PaynetApi::Config" do
        expect(subject.options[:base_url]).to eq(PaynetApi::Config.base_url)
        expect(subject.options[:basic_auth_user]).to eq(PaynetApi::Config.basic_auth_user)
        expect(subject.options[:basic_auth_password]).to eq(PaynetApi::Config.basic_auth_password)
      end
    end

    context "options parameters supplied" do
      let(:options) {{ base_url: "http://trump.com", basic_auth_user: "donald.trump", basic_auth_password: "glitter is gold" }}
      subject { PaynetApi::SearchForCompany::Request.new(company_name: "Acme Co", city: "Durham", state_code: "NC", opts: options) }

      it "contains the default options set in PaynetApi::Config" do
        expect(subject.options[:base_url]).to eq(options[:base_url])
        expect(subject.options[:basic_auth_user]).to eq(options[:basic_auth_user])
        expect(subject.options[:basic_auth_password]).to eq(options[:basic_auth_password])
      end
    end
  end

  describe "#from_params" do
    context "params just minimum" do
      let(:params_hash) { { city: "", company_name: "", state_code: "" } }
      subject { PaynetApi::SearchForCompany::Request.from_params(params_hash) }

      its(:params) { is_expected.to include(params_hash) }
    end
    context "params contain alias" do
      let(:params_hash) { { alias: "Make America Great Again Corp.", city: "", company_name: "", state_code: "" } }
      subject { PaynetApi::SearchForCompany::Request.from_params(params_hash) }

      its(:params) { is_expected.to include(params_hash) }
    end
  end
end
