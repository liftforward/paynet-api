require "./spec/fixtures/bps_report_bankruptcies"
require "./spec/fixtures/bps_report_ucc_filings"
require "./spec/fixtures/bps_report_criminal_records"
require "./spec/fixtures/bps_report_liens_judgments"
require "./spec/fixtures/bps_report_akas"
require "./spec/fixtures/bps_report_properties"
require "./spec/fixtures/bps_report_controlled_substances"

describe PaynetApi::BpsReport::Response do
  let(:request) { "" }
  let(:request_xml) { "" }
  let(:response_xml) { "" }

  subject { PaynetApi::BpsReport::Response.new response_xml, request_xml }

  context 'no xml supplied to init' do
    let(:response_xml) { nil }

    it { is_expected.not_to be_success }
    its (:error?) { is_expected.to eq(false) }
  end

  context 'report has no data' do
    let(:response_xml) { File.read 'spec/fixtures/bps_report_no_data.xml' }

    it { is_expected.not_to be_success }
    its (:error?) { is_expected.to eq(false) }
  end

  context 'response is soap fault' do
    let(:response_xml) { File.read 'spec/fixtures/soap_fault_response.xml' }

    it { is_expected.not_to be_success }
    its (:error?) { is_expected.to eq(true) }
  end

  context 'response is insufficient privileges ERROR' do
    let(:response_xml) { File.read 'spec/fixtures/insufficient_privilege_response.xml' }

    it { is_expected.not_to be_success }
    its (:error?) { is_expected.to eq(true) }
  end

  context 'response is success' do
    let(:response_xml) { File.read 'spec/fixtures/bps_report_response_success.xml' }

    it { is_expected.to be_success }
    its (:error?) { is_expected.to eq(false) }
  end

  describe "#success?" do 
    context "when individual has data" do 
      let(:response) { File.read("./spec/fixtures/bps_report_response_success.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      it { is_expected.to be_success }
    end

    context "with no report" do
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      it { is_expected.not_to be_success }
    end

    context "with nil response" do
      let(:response) { nil }
      subject { PaynetApi::BpsReport::Response.new response, request }
      it { is_expected.not_to be_success }
    end
  end


  describe "#error?" do
    context "when individual has data" do 
      let(:response) { File.read("./spec/fixtures/bps_report_response_success.xml") }
      it { is_expected.not_to be_error }
    end

    context "with no report" do
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      it { is_expected.not_to be_error }
    end

    context "with nil response" do
      let(:response) { nil }
      it { is_expected.not_to be_error }
    end

    context "with soap Fault response" do
      let(:response) { File.read("./spec/fixtures/soap_fault_response.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      it { is_expected.to be_error }
    end
  end

  describe "#not_found?" do
    context "when individual has data" do 
      let(:response) { File.read("./spec/fixtures/bps_report_response_success.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      its(:not_found?) { is_expected.to be false }
    end

    context "with no report" do
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      its(:not_found?) { is_expected.to be true }
    end

    context "with nil response" do
      let(:response) { nil }
      subject { PaynetApi::BpsReport::Response.new response, request }
      its(:not_found?) { is_expected.to be true }
    end

  end

  describe "#ucc_filings" do
    context "with more than one ucc_filings" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_ucc_criminal_and_bankruptcy_response.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_ucc_filings) {  SampleData::UCCFilings }

      it "returns a hashed list of ucc_filings" do
        expect(subject.ucc_filings).to be_equivalent_to(expected_ucc_filings)
      end
    end

    context "without ucc_filings" do 
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_ucc_filings) { [] }

      it "returns a hashed list of ucc_filings" do
        expect(subject.ucc_filings).to be_equivalent_to(expected_ucc_filings)
      end
    end

    context "with one ucc_filings" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_one_ucc_filing.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_ucc_filings) {  [SampleData::UCCFilings.first] }

      it "returns a hashed list of one ucc_filing" do
        expect(subject.ucc_filings).to be_equivalent_to(expected_ucc_filings)
      end
    end
  end

  describe "#bps_report_response_ex" do 
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected) { Hashie::Mash } 
      it "returns the bps_report_response_ex" do
        expect(subject.bps_report_response_ex.class).to be_equivalent_to(expected)
      end
  end

  describe "#bankruptcies" do 
    context "with more than one bankruptcy" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_bankruptcies.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_bankruptcies) { SampleData::Bankruptcies }

      it "returns a hashed list of bankruptcy hashes" do
        expect(subject.bankruptcies).to be_equivalent_to(expected_bankruptcies)
      end
    end

    context "without bankruptcies" do 
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_bankruptcies) { [] } # it returns an empty list 

      it "returns an empty list" do
        expect(subject.bankruptcies).to be_equivalent_to(expected_bankruptcies)
      end
    end
    
    context "with one bankrupty" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_one_bankruptcy.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_bankruptcies) {  [SampleData::Bankruptcies.last]   } 

      it "returns a list with one bankruptcy " do
        expect(subject.bankruptcies).to be_equivalent_to(expected_bankruptcies)
      end
    end

  end

  describe "#criminal_records" do
    context "with more than one criminal_records" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_ucc_criminal_and_bankruptcy_response.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_criminal_records) { SampleData::CriminalRecords }
      it "returns a hashed list of criminal records" do
        expect(subject.criminal_records).to be_equivalent_to(expected_criminal_records)
      end
    end

    context "without criminal_records" do 
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_criminal_records) { [] }

      it "returns an empty list" do
        expect(subject.criminal_records).to be_equivalent_to(expected_criminal_records)
      end
    end

    context "with one criminal_records" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_one_criminal_record.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_criminal_records) { [SampleData::CriminalRecords.first] }

      it "returns a hashed list of one criminal record" do
        expect(subject.criminal_records).to be_equivalent_to(expected_criminal_records)
      end
    end
  end

  describe "#liens_judgments" do
    context "with more than one" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_lien_and_ucc_response.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_liens_judgments) { SampleData::LiensJudgments }

      it "returns a hashed list of liens_judgments" do
        expect(subject.liens_judgments).to be_equivalent_to(expected_liens_judgments)
      end
    end

    context "without liens_judgments" do
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_liens_judgments) { [] }

      it "returns an empty list" do
        expect(subject.liens_judgments).to be_equivalent_to(expected_liens_judgments)
      end
    end

    context "with one liens_judgement" do
      let(:response) { File.read("./spec/fixtures/bps_report_with_lien_and_ucc_response.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_liens_judgments) { [SampleData::LiensJudgments.first] }

      it "returns a list of one liens_judgments" do
        expect(subject.liens_judgments).to be_equivalent_to(expected_liens_judgments)
      end
    end
  end

  describe '#akas' do 
    let(:response) { File.read("./spec/fixtures/bps_report_with_lien_and_ucc_response.xml") }
    let(:expected_akas) { SampleData::Akas }

    context 'with MULTIPLE akas' do
      subject { PaynetApi::BpsReport::Response.new response, request }

      it "returns a hashed list of akas" do
        expect(subject.akas).to be_equivalent_to(expected_akas)
      end
    end

    context 'with one aka' do
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected) { [SampleData::Akas].first }

      it "returns a hashed list of ONE aka" do
        expect(subject.akas).to be_equivalent_to(expected)
      end
    end

    context 'with NO akas' do
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_akas) { [] } 

      it "returns an empty list" do
        expect(subject.akas).to be_equivalent_to(expected_akas)
      end
    end
  end

  describe '#properties' do 
    let(:response) { File.read("./spec/fixtures/bps_report_success.xml") }
    let(:expected_properties) { SampleData::Properties }

    context 'with MULTIPLE properties' do
      subject { PaynetApi::BpsReport::Response.new response, request }

      it "returns a hashed list of properties" do
        expect(subject.properties).to be_equivalent_to(expected_properties)
      end
    end

    context 'with one property'  do
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected) { [SampleData::Properties].first }

      it "returns a hashed list of ONE property" do
        expect(subject.properties).to be_equivalent_to(expected)
      end
    end

    context 'with NO properties' do
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_properties) { [] } 

      it "returns an empty list" do
        expect(subject.properties).to be_equivalent_to(expected_properties)
      end
    end
  end

  describe '#controlled_substances' do 
    let(:response) { File.read("./spec/fixtures/bps_report_success.xml") }
    let(:expected_controlled_substances) { SampleData::ControlledSubstances }

    context 'with MULTIPLE controlled_substances' do
      subject { PaynetApi::BpsReport::Response.new response, request }

      it "returns a hashed list of controlled_substances" do
        expect(subject.controlled_substances).to be_equivalent_to(expected_controlled_substances)
      end
    end

    context 'with one controlled_substance'  do
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected) { [SampleData::ControlledSubstances].first }

      it "returns a hashed list of ONE property" do
        expect(subject.controlled_substances).to be_equivalent_to(expected)
      end
    end

    context 'with NO controlled_substances' do
      let(:response) { File.read("./spec/fixtures/bps_report_no_data.xml") }
      subject { PaynetApi::BpsReport::Response.new response, request }
      let(:expected_controlled_substances) { [] } 

      it "returns an empty list" do
        expect(subject.controlled_substances).to be_equivalent_to(expected_controlled_substances)
      end
    end
  end
end

