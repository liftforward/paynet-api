describe PaynetApi::EchoTest::Request do

  context "a value in is provided" do
    let(:value_in) { "test value in" }
    subject { PaynetApi::EchoTest::Request.new(value_in) }
    its(:as_xml) { is_expected.to eq("<ValueIn>#{value_in}</ValueIn>") }
  end

  describe '#wsdl' do
    subject { PaynetApi::EchoTest::Request.new.wsdl }
    context 'base_url is set to http://dtrump.com' do
      before { PaynetApi::Config.base_url = "http://dtrump.com"}
      it { is_expected.to eq("http://dtrump.com/WsAccurint/EchoTest?wsdl") }
    end
    context 'base_url is nil' do
      before { PaynetApi::Config.base_url = nil}
      it { is_expected.to eq("/WsAccurint/EchoTest?wsdl") }
    end
  end
end