describe PaynetApi::ReportRequest do
  let(:test_id_from_paynet) { "59206906" }

  let(:request) { PaynetApi::ReportRequest.new(paynet_id: test_id_from_paynet, payment_comprehensive: "1") }
  let(:request_with_options) { PaynetApi::ReportRequest.new(
    paynet_id: test_id_from_paynet,
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
  let(:request_without_paynet_id) { PaynetApi::ReportRequest.new }
  let(:request_without_any_reports_chosen) { PaynetApi::ReportRequest.new(paynet_id: test_id_from_paynet) }

  subject { request }

  describe ".FORMAT" do
    it "defaults to nil" do
      expect(subject.class::FORMAT).to eq(nil)
    end
  end

  describe "#initialize" do
    context "with required params passed in" do
      its (:paynet_id){ should eq(test_id_from_paynet) }

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

  describe "#query" do
    let(:query) { URI.encode("password=#{ENV["BASIC_AUTH_PASSWORD"]}&payment_comprehensive=1&paynet_id=#{subject.paynet_id}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }

    context "with required arguments" do
      it "creates the correct encoded path with params for Paynet" do
        expect(subject.query).to eq(query)
      end
    end

    context "with optional arguments" do
      let(:query_with_options) { URI.encode("business_background=#{subject.business_background}&constr_score=#{subject.constr_score}&expanded_vars=#{subject.expanded_vars}&legal_name=#{subject.legal_name}&master_score=#{subject.master_score}&office_score=#{subject.office_score}&password=#{ENV["BASIC_AUTH_PASSWORD"]}&payment_comprehensive=#{subject.payment_comprehensive}&paynet_id=#{subject.paynet_id}&public_filings=#{subject.public_filings}&transpo_score=#{subject.transpo_score}&ucc_filings=#{subject.ucc_filings}&user=#{ENV["BASIC_AUTH_USER"]}&version=0320") }
      subject { request_with_options }

      it "creates the correct encoded query with params for Paynet" do
        expect(subject.query).to eq(query_with_options)
      end
    end
  end
end
