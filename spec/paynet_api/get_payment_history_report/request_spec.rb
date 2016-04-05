describe PaynetApi::GetPaymentHistoryReport::Request do
  subject { PaynetApi::GetPaymentHistoryReport::Request }

  describe ".ENDPOINT" do
    it "equals get_payment_history_report.asp" do
      expect(subject::ENDPOINT).to eq("get_payment_history_report.asp")
    end
  end
end
