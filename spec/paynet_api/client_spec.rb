describe PaynetApi::Client do
  subject { PaynetApi::Client.new }

  # describe "#get_payment_history_report" do
  #   let(:params) { { company_name: "Acme Co", city: "Durham", state_code: "NC"} }
  #   let(:request_double) { instance_double(PaynetApi::GetPaymentHistoryReport::Request, :send! => "faraday object") }

  #   context "with required params passed in" do
  #     before do
  #       allow(PaynetApi::GetPaymentHistoryReport::Request).to receive(:new).with(params).and_return(request_double)
  #       allow(PaynetApi::GetPaymentHistoryReport::Response).to receive(:new).with(response: "faraday object").and_return("final response object")
  #     end

  #     it "should make a new paynet search request object with the passed in params" do
  #       expect(PaynetApi::GetPaymentHistoryReport::Request).to receive(:new).with(params).and_return(request_double)
  #       subject.get_payment_history_report(params)
  #     end

  #     it "should send the newly created request object to Paynet" do
  #       expect(request_double).to receive(:send!)
  #       subject.get_payment_history_report(params)
  #     end

  #     it "should make a new paynet search reponse object with the Paynet faraday response" do
  #       expect(PaynetApi::GetPaymentHistoryReport::Response).to receive(:new).with(response: "faraday object")
  #       subject.get_payment_history_report(params)
  #     end

  #     it "should return the final response object" do
  #       allow(PaynetApi::GetPaymentHistoryReport::Response).to receive(:new).with(response: "faraday object").and_return("final response object")
  #       expect(subject.get_payment_history_report(params)).to eq("final response object")
  #     end
  #   end
  # end

  describe "#search_for_company" do
    let(:params) { { company_name: "Acme Co", city: "Durham", state_code: "NC"} }
    let(:client) { PaynetApi::Client.new }
    subject(:search) { client.search_for_company(params) }

    context "with required params passed in" do
      let(:faraday_response_double) { double("Response") }
      before do
        expect(client).to receive(:get).and_return(faraday_response_double)
        expect(faraday_response_double).to receive(:body).and_return("<response></response>")
      end

      it "should make a new paynet search for company request & response objects with the passed in params" do
        expect(PaynetApi::SearchForCompany::Request).to receive(:new).with(params)
        expect(PaynetApi::SearchForCompany::Response).to receive(:new)
        search
      end

      it "should return a PaynetApi::SearchForCompany::Response" do
        expect(subject).to be_a(PaynetApi::SearchForCompany::Response)
      end

    end
  end
end
