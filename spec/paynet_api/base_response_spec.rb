describe PaynetApi::BaseResponse do
  subject{ PaynetApi::BaseResponse.new(response_xml: xml, request: "foo") }

  describe "#success?" do
    context "when there is an error code of 0" do
      let(:xml) { File.read 'spec/fixtures/search_for_company_multiple_results.xml' }

      it "returns true" do
        expect(subject.success?).to be true
      end
    end

    context "when there is an error code of something other than zero" do
      let(:xml) { File.read 'spec/fixtures/search_for_company_error.xml' }

      it "returns false" do
        expect(subject.success?).to be false
      end
    end
  end
end
