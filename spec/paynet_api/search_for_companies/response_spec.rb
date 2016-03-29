describe PaynetApi::SearchForCompany::Response do
  let(:response_double) { instance_double(Faraday::Response,
    "body" => {
      "response" => {
        "companies" => {
          "company" => ["company 1", "company 2", "company 3"]
        }
      }
    },
    "status" => 200,
    "success?" => true
  )}

  let(:response_double_no_companies) { instance_double(Faraday::Response,
    body: {
      response: {}
    },
    status: 200,
    success?: true
  )}

  let(:response) { PaynetApi::SearchForCompany::Response.new(response: response_double) }
  let(:response_no_companies) { PaynetApi::SearchForCompany::Response.new(response: response_double_no_companies) }

  subject { response }

  describe "#companies" do
    context "when the response from Paynet includes companies" do
      its (:companies){ should eq(response_double.body["response"]["companies"]["company"]) }
    end

    context "when the response from Paynet does not include companies" do
      subject { response_no_companies }
      its (:companies){ should eq(nil) }
    end
  end

end
