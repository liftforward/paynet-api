describe PaynetApi::CobrandGetPaymentHistoryReport::Request do
  let(:test_id_from_paynet) { "59206906" }

  subject { PaynetApi::CobrandGetPaymentHistoryReport::Request.new(paynet_id: test_id_from_paynet, payment_comprehensive: "1") }

  describe ".ENDPOINT" do
    it "equals cobrand_get_payment_history_report.asp" do
      expect(subject.class::ENDPOINT).to eq("cobrand_get_payment_history_report.asp")
    end
  end

  describe ".FORMAT" do
    it "equals pdf" do
      expect(subject.class::FORMAT).to eq("pdf")
    end
  end
end
