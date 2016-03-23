# options to pull a report with bankruptcies
    report_by_with_bk = {
      name: {
        full: "HOWARD ARTHUR KIRKARZI",
      },
      address: {
        street_address_1: "6720 COHNSON CIR",
        city: "WOLFHILL",
        state: "AK",
        zip5: "10813"
      },
      ssn: "773241348",
      dob: {
        year: 1974,
        month: 12,
        day: 23,
      }
    }

    options_with_bk = {
          include_bankruptcies: true,
          include_liens_judgments: true,
          include_ucc_filings: true,
          include_criminal_records: true
    }
  # end options

  



describe "PaynetApi Integration ", :slow, :integration do

  PaynetApi::Config.basic_auth_user = ENV["BASIC_AUTH_USER"]
  PaynetApi::Config.basic_auth_password = ENV["BASIC_AUTH_PASSWORD"]
  PaynetApi::Config.proxy_url = ENV["PROXY_URL"]
  PaynetApi::Config.base_url = ENV["BASE_URL"]
  PaynetApi::Config.logger = Logger.new("log/test.log")
  PaynetApi::Config.log = true
  PaynetApi::Config.log_level = :debug

  client = PaynetApi::Client.new

  describe "echo test API" do
    request = PaynetApi::EchoTest::Request.new("monkeys")
    response = client.echo_test(request)
    subject { response }

    it { is_expected.to be_success }
    its(:value_out) { is_expected.to eq("monkeys") }
  end

  describe "Bps Report" do
    user = {}
    options = {}
    report_by = {
      name: {
        full: "SIDNEY HIRSCH ALEXERO",
      },
      address: {
        street_address_1: "97 TELLERO DR.",
        city: "GREENWATER",
        state: "FL",
        zip5: "93840"
      },
      ssn: "773850198",
      dob: {
        year: 1939,
        month: 10,
        day: 16,
      }
    }

    request = PaynetApi::BpsReport::Request.new(user, options, report_by)
    response = client.bps_report(request)
    subject { response }

    it { is_expected.to be_success }
    its(:as_xml) { is_expected.not_to be_nil }
    pending "some validation that the response returns a xml document"
  end

  pending "invalid authentication"
  pending "some sort of exception or error"
end



