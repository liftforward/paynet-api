describe PaynetApi::CobrandGetPaymentHistoryReport::Request do
  subject { PaynetApi::CobrandGetPaymentHistoryReport::Request.new(paynet_id: TEST_IDS_FROM_PAYNET[0], payment_comprehensive: "1") }

  describe ".ENDPOINT" do
    it "equals cobrand_get_payment_history_report.asp" do
      expect(subject.class::ENDPOINT).to eq("cobrand_get_payment_history_report.asp")
    end
  end

  describe "#format" do
    it "equals pdf" do
      expect(subject.format).to eq("pdf")
    end
  end
end
