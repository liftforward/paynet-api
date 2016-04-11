describe PaynetApi::Client do
  let(:client) { PaynetApi::Client.new }

  describe "#cobrand_get_payment_history_report" do
    let(:test_id_from_paynet) { "59206906" }
    let(:params) { { paynet_id: test_id_from_paynet, payment_comprehensive: "1" } }
    subject(:search) { client.cobrand_get_payment_history_report(params) }

    context "with required params passed in" do
      let(:faraday_response_double) { double("Response") }
      before do
        expect(client).to receive(:get).and_return(faraday_response_double)
      end

      it "should make new PaynetApi::CobrandGetPaymentHistoryReport Request & Response objects with the passed in params" do
        expect(PaynetApi::CobrandGetPaymentHistoryReport::Request).to receive(:new).with(params)
        expect(PaynetApi::CobrandGetPaymentHistoryReport::Response).to receive(:new)
        subject
      end

      it "should return a PaynetApi::CobrandGetPaymentHistoryReport::Response" do
        allow(faraday_response_double).to receive(:body)
        allow(faraday_response_double).to receive(:status)
        allow(faraday_response_double).to receive(:headers).and_return({"content-type"=> "application/pdf"})
        expect(subject).to be_a(PaynetApi::CobrandGetPaymentHistoryReport::Response)
      end
    end
  end

  describe "#get_payment_history_report" do
    let(:test_id_from_paynet) { "59206906" }
    let(:params) { { paynet_id: test_id_from_paynet, payment_comprehensive: "1" } }
    subject(:search) { client.get_payment_history_report(params) }

    context "with required params passed in" do
      let(:faraday_response_double) { double("Response") }
      before do
        expect(client).to receive(:get).and_return(faraday_response_double)
        expect(faraday_response_double).to receive(:body).and_return("<response></response>")
      end

      it "should make new PaynetApi::GetPaymentHistoryReport Request & Response objects with the passed in params" do
        expect(PaynetApi::GetPaymentHistoryReport::Request).to receive(:new).with(params)
        expect(PaynetApi::GetPaymentHistoryReport::Response).to receive(:new)
        subject
      end

      it "should return a PaynetApi::GetPaymentHistoryReport::Response" do
        expect(subject).to be_a(PaynetApi::GetPaymentHistoryReport::Response)
      end
    end
  end

  describe "#search_for_company" do
    let(:params) { { company_name: "Acme Co", city: "Durham", state_code: "NC"} }
    subject { client.search_for_company(params) }

    context "with required params passed in" do
      let(:faraday_response_double) { double("Response") }
      before do
        expect(client).to receive(:get).and_return(faraday_response_double)
        expect(faraday_response_double).to receive(:body).and_return("<response></response>")
      end

      it "should make new PaynetApi::SearchForCompany Request & Response objects with the passed in params" do
        expect(PaynetApi::SearchForCompany::Request).to receive(:new).with(params)
        expect(PaynetApi::SearchForCompany::Response).to receive(:new)
        subject
      end

      it "should return a PaynetApi::SearchForCompany::Response" do
        expect(subject).to be_a(PaynetApi::SearchForCompany::Response)
      end

    end
  end
end
