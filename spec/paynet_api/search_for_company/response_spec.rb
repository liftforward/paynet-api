describe PaynetApi::SearchForCompany::Response do

  subject { PaynetApi::SearchForCompany::Response.new response_xml: xml, request: nil }

  context "response contains error response" do
    let(:xml) { File.read 'spec/fixtures/search_for_company_error.xml' }

    its(:success?) { is_expected.to be(false) }
    its(:companies) { is_expected.to be_a(Array) }
    its(:companies) { is_expected.to be_empty }
  end

  context "response contains no results" do
    let(:xml) { File.read 'spec/fixtures/search_for_company_no_results.xml' }

    its(:success?) { is_expected.to be(true) }
    its(:companies) { is_expected.to be_a(Array) }
    its(:companies) { is_expected.to be_empty }
  end

  context "response contains 1 results" do
    let(:xml) { File.read 'spec/fixtures/search_for_company_1_result.xml' }

    its(:success?) { is_expected.to be(true) }
    its(:companies) { is_expected.to be_a(Array) }
    its(:companies) { is_expected.to have(1).items }
  end

  context "response contains multiple results" do
    let(:xml) { File.read 'spec/fixtures/search_for_company_multiple_results.xml' }

    its(:success?) { is_expected.to be(true) }
    its(:companies) { is_expected.to be_a(Array) }
    its(:companies) { is_expected.to have(20).items }
  end


end
