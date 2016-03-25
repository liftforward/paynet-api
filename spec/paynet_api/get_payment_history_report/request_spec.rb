require 'pry'
TEST_IDS_FROM_PAYNET = ["59206906", "25430734", "105755259"]

describe PaynetApi::GetPaymentHistoryReport::Request do
  let(:request) { PaynetApi::GetPaymentHistoryReport::Request.new(paynet_id: TEST_IDS_FROM_PAYNET[0]) }
  let(:request_with_options) { PaynetApi::GetPaymentHistoryReport::Request.new(
    paynet_id: TEST_IDS_FROM_PAYNET[0],
    payment_comprehensive: "1",
    business_background: "1",
    public_filings: "1",
    ucc_filings: "1",
    legal_name: "1",
    transpo_score: "2",
    office_score: "1",
    constr_score: "1",
    master_score: "2",
    expanded_vars: "1"
  ) }
  let(:request_with_missing_arguments) { PaynetApi::GetPaymentHistoryReport::Request.new() }

  subject { request }

  describe "#initialize" do
    context "with required params passed in" do
      its (:paynet_id){ should eq(TEST_IDS_FROM_PAYNET[0]) }

      context "with optional arguments" do
        subject { request_with_options }
        its (:payment_comprehensive){ should eq("1") }
        its (:business_background){ should eq("1") }
        its (:public_filings){ should eq("1") }
        its (:ucc_filings){ should eq("1") }
        its (:legal_name){ should eq("1") }
        its (:transpo_score){ should eq("2") }
        its (:office_score){ should eq("1") }
        its (:constr_score){ should eq("1") }
        its (:master_score){ should eq("2") }
        its (:expanded_vars){ should eq("1") }
      end

      context "without optional arguments" do
        its (:payment_comprehensive){ should eq(nil) }
        its (:business_background){ should eq(nil) }
        its (:public_filings){ should eq(nil) }
        its (:ucc_filings){ should eq(nil) }
        its (:legal_name){ should eq(nil) }
        its (:transpo_score){ should eq(nil) }
        its (:office_score){ should eq(nil) }
        its (:constr_score){ should eq(nil) }
        its (:master_score){ should eq(nil) }
        its (:expanded_vars){ should eq(nil) }
      end
    end

    context "without required params passed in" do
      it "raises an argument error" do
        expect{ request_with_missing_arguments }.to raise_error(ArgumentError, "missing keyword: paynet_id")
      end
    end
  end

  describe "#url" do
    let(:url) { URI.encode("#{ENV["BASE_URL"]}get_payment_history_report.asp?city=#{subject.city}&company_name=#{subject.company_name}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&state_code=#{subject.state_code}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }

    context "with required arguments" do
      it "creates the correct encoded url with params for Paynet" do
        expect(subject.url).to eq(url)
      end
    end

    context "with optional arguments" do
      let(:url_with_options) { URI.encode("#{ENV["BASE_URL"]}get_payment_history_report.asp?city=#{subject.city}&company_name=#{subject.company_name}&name_match_threshold=#{subject.name_match_threshold}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&phone=#{subject.phone}&state_code=#{subject.state_code}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }
      subject { request_with_options }

      it "creates the correct encoded url with params for Paynet" do
        expect(subject.url).to eq(url_with_options)
      end
    end
  end

  describe "#send!" do
    let(:url){ URI.encode("#{ENV["BASE_URL"]}get_payment_history_report.asp?user=#{ENV["BASIC_AUTH_USER"]}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&version=0320&company_name=#{subject.company_name}&city=#{subject.city}&state_code=#{subject.state_code}") }

    it "sends Faraday the url" do
      expect(Faraday).to receive(:get).with(subject.url)
      subject.send!
    end

    it "Successfully connects to Paynet" do
      WebMock.allow_net_connect!
      VCR.turned_off do
        response = subject.send!
        expect(response.success?).to be true
        expect(response.body).not_to be nil
      end
    end
  end

end
