require 'pry'

describe PaynetApi::Client do
  let(:params) { { company_name: "Acme Co", city: "Durham", state_code: "NC"} }
  let(:request_double) { instance_double(PaynetApi::SearchForCompany::Request, :send! => "faraday object") }

  subject { PaynetApi::Client.new }

  describe "#search_for_company" do
    context "with required params passed in" do
      before do
        allow(PaynetApi::SearchForCompany::Request).to receive(:new).with(params).and_return(request_double)
        allow(PaynetApi::SearchForCompany::Response).to receive(:new).with(response: "faraday object").and_return("final response object")
      end

      it "should make a new paynet search request object with the passed in params" do
        expect(PaynetApi::SearchForCompany::Request).to receive(:new).with(params).and_return(request_double)
        subject.search_for_company(params)
      end

      it "should send the newly created request object to Paynet" do
        expect(request_double).to receive(:send!)
        subject.search_for_company(params)
      end

      it "should make a new paynet search reponse object with the Paynet faraday response" do
        expect(PaynetApi::SearchForCompany::Response).to receive(:new).with(response: "faraday object")
        subject.search_for_company(params)
      end

      it "should return the final response object" do
        allow(PaynetApi::SearchForCompany::Response).to receive(:new).with(response: "faraday object").and_return("final response object")
        expect(subject.search_for_company(params)).to eq("final response object")
      end
    end
  end
end
