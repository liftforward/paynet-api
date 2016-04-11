describe PaynetApi::CobrandGetPaymentHistoryReport::Response do
  subject{ PaynetApi::CobrandGetPaymentHistoryReport::Response.new(response: faraday_response_double, request: "foo") }

  describe "#success?" do
    context "when the content header content type is application/pdf" do
      let(:faraday_response_double) { instance_double("Response", body: nil, status: nil, headers: {"content-type"=> "application/pdf"} ) }

      it "returns true" do
        expect(subject.success?).to be true
      end
    end

    context "when the content header content type is something other than application/pdf" do
      let(:faraday_response_double) { instance_double("Response", body: nil, status: nil, headers: {"content-type"=> "text"} ) }

      it "returns false" do
        expect(subject.success?).to be false
      end
    end
  end
end
