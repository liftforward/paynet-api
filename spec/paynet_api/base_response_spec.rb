describe PaynetApi::BaseResponse do
  # let(:response_double) { instance_double(Faraday::Response,
  #   body: { response: {
  #     error_code: 200,
  #     version: 0320
  #     }},
  #   status: 200,
  #   success?: true
  # )}

  let(:response) { PaynetApi::BaseResponse.new(response_double, nil) }
  # let(:response_without_faraday_object) { PaynetApi::BaseResponse.new }

  subject{ response }

  describe "#initialize" do
    # context "with a faraday response passed in" do
    #   its (:body){ should eq(response_double.body) }
    #   its (:status){ should eq(response_double.status) }
    #   its (:success?){ should eq(response_double.success?) }
    #   its (:error_code){ should eq(response_double.body[:error_code]) }
    #   its (:version){ should eq(response_double.body[:version]) }
    # end

    # context "without a faraday response passed in" do
    #   it "raises an argument error" do
    #     expect{ response_without_faraday_object }.to raise_error(ArgumentError, "missing keyword: response")
    #   end
    # end
  end
end
