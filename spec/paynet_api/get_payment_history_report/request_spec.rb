require 'pry'
TEST_IDS_FROM_PAYNET = ["59206906", "25430734", "105755259"]

describe PaynetApi::GetPaymentHistoryReport::Request do
  let(:request) { PaynetApi::GetPaymentHistoryReport::Request.new(paynet_id: TEST_IDS_FROM_PAYNET[0], payment_comprehensive: "1") }
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
  let(:request_without_paynet_id) { PaynetApi::GetPaymentHistoryReport::Request.new }
  let(:request_without_any_reports_chosen) { PaynetApi::GetPaymentHistoryReport::Request.new(paynet_id: TEST_IDS_FROM_PAYNET[0]) }

  subject { request }

  describe "#initialize" do
    context "with required params passed in" do
      its (:paynet_id){ should eq(TEST_IDS_FROM_PAYNET[0]) }

      # Ramdonly picking one of the reports to pass in
      # payment comprehensive isn't required, but passing in ONE report IS.
      its (:payment_comprehensive){ should eq("1") }

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

    context "without a paynet_id passed in" do
      it "raises an argument error" do
        expect{ request_without_paynet_id }.to raise_error(ArgumentError, "missing keyword: paynet_id")
      end
    end

    context "without any report chosen" do
      it "raises an argument error" do
        expect{ request_without_any_reports_chosen }.to raise_error(ArgumentError, "You must pass in a value for at least one of the following params: payment_comprehensive, business_background, public_filings, ucc_filings, legal_name, transpo_score, office_score, constr_score, master_score, or expanded_vars")
      end
    end
  end

  describe "#url" do
    let(:url) { URI.encode("#{ENV["BASE_URL"]}get_payment_history_report.asp?password=#{ENV["BASIC_AUTH_PASSWORD"]}&payment_comprehensive=1&paynet_id=#{subject.paynet_id}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }

    context "with required arguments" do
      it "creates the correct encoded url with params for Paynet" do
        expect(subject.url).to eq(url)
      end
    end

    context "with optional arguments" do
      let(:url_with_options) { URI.encode("#{ENV["BASE_URL"]}get_payment_history_report.asp?business_background=#{subject.business_background}&constr_score=#{subject.constr_score}&expanded_vars=#{subject.expanded_vars}&legal_name=#{subject.legal_name}&master_score=#{subject.master_score}&office_score=#{subject.office_score}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&payment_comprehensive=#{subject.payment_comprehensive}&paynet_id=#{subject.paynet_id}&public_filings=#{subject.public_filings}&transpo_score=#{subject.transpo_score}&ucc_filings=#{subject.ucc_filings}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }
      subject { request_with_options }

      it "creates the correct encoded url with params for Paynet" do
        expect(subject.url).to eq(url_with_options)
      end
    end
  end

  describe "#send!" do
    let(:faraday_connection_double) { instance_double(Faraday::Connection, :get => "faraday response")}

    it "sends Faraday the url" do
      expect(Faraday).to receive(:new).with(subject.url).and_return(faraday_connection_double)
      expect(faraday_connection_double).to receive(:get)
      subject.send!
    end
  end
end
