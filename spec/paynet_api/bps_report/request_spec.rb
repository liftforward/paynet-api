describe PaynetApi::BpsReport::Request do
  its(:builder) { is_expected.to be_a(Builder::XmlMarkup) }
  its(:options) { is_expected.to be_a(String) }

  describe "#user" do

    context "no parameters supplied to initialize" do
      let (:expected_user) { "
        <User>
          <ReferenceCode/>
          <BillingCode/>
          <QueryId/>
          <GLBPurpose/>
          <DLPurpose/>
          <AccountNumber/>
        </User>"}

      it "#user returns valid user xml" do
        expect(Nokogiri::XML(subject.user)).to be_equivalent_to(Nokogiri::XML(expected_user))
      end
    end

    context "parameters supplied to initialize" do
      let (:user) { 
      {
        reference_code: "test ref code",
        billing_code: "test billing code",
        query_id: "some query id",
        glb_purpose: "some purpose code",
        dl_purpose: "some dl_purpose",
        account_number: 123456,
        business: {
          name: "Ajax Corporation",
          address: "123 NW Main Street",
          city: "Cocoplum",
          stateabbrev: "FL",
          zip: "33442",
          }
        }
      }

      subject { PaynetApi::BpsReport::Request.new user }

      let (:expected_user) { "
        <User>
          <ReferenceCode>test ref code</ReferenceCode>
          <BillingCode>test billing code</BillingCode>
          <QueryId>some query id</QueryId>
          <GLBPurpose>some purpose code</GLBPurpose>
          <DLPurpose>some dl_purpose</DLPurpose>
          <EndUser>
            <CompanyName>Ajax Corporation</CompanyName>
            <StreetAddress1>123 NW Main Street</StreetAddress1>
            <City>Cocoplum</City>
            <State>FL</State>
            <Zip5>33442</Zip5>
          </EndUser>
          <AccountNumber>123456</AccountNumber>
        </User>"}

      it "#user returns valid user xml" do
        expect(Nokogiri::XML(subject.user)).to be_equivalent_to(Nokogiri::XML(expected_user))
      end
    end
  end



  describe "#options" do
    context "no parameters supplied to initialize" do

      let (:expected_options) {"
          <Options>
            <IncludeAKAs>0</IncludeAKAs>
            <IncludeImposters>0</IncludeImposters>
            <IncludeOldPhones>0</IncludeOldPhones>
            <IncludeAssociates>0</IncludeAssociates>
            <IncludeProperties>0</IncludeProperties>
            <IncludePriorProperties>0</IncludePriorProperties>
            <IncludeCurrentProperties>0</IncludeCurrentProperties>
            <IncludeDriversLicenses>0</IncludeDriversLicenses>
            <IncludeMotorVehicles>0</IncludeMotorVehicles>
            <IncludeBankruptcies>0</IncludeBankruptcies>
            <IncludeLiensJudgments>0</IncludeLiensJudgments>
            <IncludeCorporateAffiliations>0</IncludeCorporateAffiliations>
            <IncludeUCCFilings>0</IncludeUCCFilings>
            <IncludeFAACertificates>0</IncludeFAACertificates>
            <IncludeCriminalRecords>0</IncludeCriminalRecords>
            <IncludeCensusData>0</IncludeCensusData>
            <IncludeAccidents>0</IncludeAccidents>
            <IncludeWaterCrafts>0</IncludeWaterCrafts>
            <IncludeProfessionalLicenses>0</IncludeProfessionalLicenses>
            <IncludeHealthCareSanctions>0</IncludeHealthCareSanctions>
            <IncludeDEAControlledSubstance>0</IncludeDEAControlledSubstance>
            <IncludeVoterRegistrations>0</IncludeVoterRegistrations>
            <IncludeHuntingFishingLicenses>0</IncludeHuntingFishingLicenses>
            <IncludeFirearmExplosives>0</IncludeFirearmExplosives>
            <IncludeWeaponPermits>0</IncludeWeaponPermits>
            <IncludeSexualOffenses>0</IncludeSexualOffenses>
            <IncludeFAAAircrafts>0</IncludeFAAAircrafts>
            <IncludePeopleAtWork>0</IncludePeopleAtWork>
            <IncludeHighRiskIndicators>0</IncludeHighRiskIndicators>
            <IncludeForeclosures>0</IncludeForeclosures>
            <IncludePhonesPlus>0</IncludePhonesPlus>
            <IncludeSourceDocs>0</IncludeSourceDocs>
            <IncludeBestInfo>0</IncludeBestInfo>
            <IncludeDriversAtAddress>0</IncludeDriversAtAddress>
            <IncludeGlobalWatchLists>0</IncludeGlobalWatchLists>
            <IncludeRealTimeVehicles>0</IncludeRealTimeVehicles>
            <IncludeFictitiousBusinesses>0</IncludeFictitiousBusinesses>
            <IncludeNoticeOfDefaults>0</IncludeNoticeOfDefaults>
            <EnableNationalAccidents>0</EnableNationalAccidents>
            <EnableExtraAccidents>0</EnableExtraAccidents>
            <AcceptedNonSolicitationTerms>0</AcceptedNonSolicitationTerms>
            <IncludeEmailAddresses>0</IncludeEmailAddresses>
            <IncludeVerification>0</IncludeVerification>
            <IncludePhoneSummary>0</IncludePhoneSummary>
            <IncludeStudentInformation>0</IncludeStudentInformation>
            <IncludeNonRegulatedVehicleSources>0</IncludeNonRegulatedVehicleSources>
            <IncludeNonRegulatedWatercraftSources>0</IncludeNonRegulatedWatercraftSources>
            <RealTimePermissibleUse/>
            <MaxAddresses/>
            <MaxSubjectAddresses/>
          </Options>"
        }

            # <Relatives>
            #   <IncludeRelatives>0</IncludeRelatives>
            #   <IncludeRelativeAddresses>0</IncludeRelativeAddresses>
            #   <MaxRelatives/>
            #   <RelativeDepth/>
            #   <MaxRelativeAddresses/>
            # </Relatives>
            # <Neighbors>
            #   <IncludeNeighbors>0</IncludeNeighbors>
            #   <IncludeHistoricalNeighbors>0</IncludeHistoricalNeighbors>
            #   <NeighborhoodCount/>
            #   <NeighborCount/>
            # </Neighbors>
            # <HealthCareProviders>
            #   <IncludeHealthCareProviders>0</IncludeHealthCareProviders>
            #   <IncludeGroupAffiliations>0</IncludeGroupAffiliations>
            #   <IncludeHospitalAffiliations>0</IncludeHospitalAffiliations>
            #   <IncludeEducation>0</IncludeEducation>
            #   <IncludeBusinessAddress>0</IncludeBusinessAddress>
            # </HealthCareProviders>


      it "#options returns valid options xml" do
        expect(Nokogiri::XML(subject.options)).to be_equivalent_to(Nokogiri::XML(expected_options))
      end
    end

    context "few options supplied to initialize" do
      let (:options) {
        {
          include_bankruptcies: true,
          include_criminal_records: true,
          relatives: {
            include_relatives: true
          },
          neighbors: {
            include_neighbors: true
          },
          health_care_providers: {
            include_health_care_providers: true
          }

        }
      }

      subject { PaynetApi::BpsReport::Request.new({}, options) }

      let (:expected_options) {"
          <Options>
            <IncludeAKAs>0</IncludeAKAs>
            <IncludeImposters>0</IncludeImposters>
            <IncludeOldPhones>0</IncludeOldPhones>
            <IncludeAssociates>0</IncludeAssociates>
            <IncludeProperties>0</IncludeProperties>
            <IncludePriorProperties>0</IncludePriorProperties>
            <IncludeCurrentProperties>0</IncludeCurrentProperties>
            <IncludeDriversLicenses>0</IncludeDriversLicenses>
            <IncludeMotorVehicles>0</IncludeMotorVehicles>
            <IncludeBankruptcies>1</IncludeBankruptcies>
            <IncludeLiensJudgments>0</IncludeLiensJudgments>
            <IncludeCorporateAffiliations>0</IncludeCorporateAffiliations>
            <IncludeUCCFilings>0</IncludeUCCFilings>
            <IncludeFAACertificates>0</IncludeFAACertificates>
            <IncludeCriminalRecords>1</IncludeCriminalRecords>
            <IncludeCensusData>0</IncludeCensusData>
            <IncludeAccidents>0</IncludeAccidents>
            <IncludeWaterCrafts>0</IncludeWaterCrafts>
            <IncludeProfessionalLicenses>0</IncludeProfessionalLicenses>
            <IncludeHealthCareSanctions>0</IncludeHealthCareSanctions>
            <IncludeDEAControlledSubstance>0</IncludeDEAControlledSubstance>
            <IncludeVoterRegistrations>0</IncludeVoterRegistrations>
            <IncludeHuntingFishingLicenses>0</IncludeHuntingFishingLicenses>
            <IncludeFirearmExplosives>0</IncludeFirearmExplosives>
            <IncludeWeaponPermits>0</IncludeWeaponPermits>
            <IncludeSexualOffenses>0</IncludeSexualOffenses>
            <IncludeFAAAircrafts>0</IncludeFAAAircrafts>
            <IncludePeopleAtWork>0</IncludePeopleAtWork>
            <IncludeHighRiskIndicators>0</IncludeHighRiskIndicators>
            <IncludeForeclosures>0</IncludeForeclosures>
            <IncludePhonesPlus>0</IncludePhonesPlus>
            <IncludeSourceDocs>0</IncludeSourceDocs>
            <IncludeBestInfo>0</IncludeBestInfo>
            <IncludeDriversAtAddress>0</IncludeDriversAtAddress>
            <IncludeGlobalWatchLists>0</IncludeGlobalWatchLists>
            <IncludeRealTimeVehicles>0</IncludeRealTimeVehicles>
            <IncludeFictitiousBusinesses>0</IncludeFictitiousBusinesses>
            <IncludeNoticeOfDefaults>0</IncludeNoticeOfDefaults>
            <EnableNationalAccidents>0</EnableNationalAccidents>
            <EnableExtraAccidents>0</EnableExtraAccidents>
            <AcceptedNonSolicitationTerms>0</AcceptedNonSolicitationTerms>
            <IncludeEmailAddresses>0</IncludeEmailAddresses>
            <IncludeVerification>0</IncludeVerification>
            <IncludePhoneSummary>0</IncludePhoneSummary>
            <IncludeStudentInformation>0</IncludeStudentInformation>
            <IncludeNonRegulatedVehicleSources>0</IncludeNonRegulatedVehicleSources>
            <IncludeNonRegulatedWatercraftSources>0</IncludeNonRegulatedWatercraftSources>
            <RealTimePermissibleUse/>
            <MaxAddresses/>
            <MaxSubjectAddresses/>
            <Relatives>
              <IncludeRelatives>1</IncludeRelatives>
              <IncludeRelativeAddresses>0</IncludeRelativeAddresses>
              <MaxRelatives/>
              <RelativeDepth/>
              <MaxRelativeAddresses/>
            </Relatives>
            <Neighbors>
              <IncludeNeighbors>1</IncludeNeighbors>
              <IncludeHistoricalNeighbors>0</IncludeHistoricalNeighbors>
              <NeighborhoodCount/>
              <NeighborCount/>
            </Neighbors>
            <HealthCareProviders>
              <IncludeHealthCareProviders>1</IncludeHealthCareProviders>
              <IncludeGroupAffiliations>0</IncludeGroupAffiliations>
              <IncludeHospitalAffiliations>0</IncludeHospitalAffiliations>
              <IncludeEducation>0</IncludeEducation>
              <IncludeBusinessAddress>0</IncludeBusinessAddress>
            </HealthCareProviders>
          </Options>"
        }

      it "#options returns valid options xml" do
        expect(Nokogiri::XML(subject.options)).to be_equivalent_to(Nokogiri::XML(expected_options))
      end
    end
  end

  describe '#report_by' do
    context "no parameters supplied to initialize" do
      let (:expected_report_by) {"
        <ReportBy>
          <SSN/>
        </ReportBy>"
      }

      it "#report_by returns valid report_by xml" do
        expect(Nokogiri::XML(subject.report_by)).to be_equivalent_to(Nokogiri::XML(expected_report_by))
      end
    end

    context "parsed parameters supplied to initialize" do
      let (:report_by) { 
        {
          name: {
            first: "SIDNEY",
            middle: "HIRSCH",
            last: "ALEXERO"
          },
          address: {
            street_number: "97",
            street_pre_direction: "North",
            street_name: "TELLERO",
            street_suffix: "DR",
            unit_designation: "Apt",
            unit_number: "1",
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
      }

      subject { PaynetApi::BpsReport::Request.new({}, {}, report_by) }

      let (:expected_report_by) {"
        <ReportBy>
          <Name>
            <Full/>
            <First>SIDNEY</First>
            <Middle>HIRSCH</Middle>
            <Last>ALEXERO</Last>
          </Name>
          <Address>
            <StreetAddress1/>
            <StreetAddress2/>
            <StreetNumber>97</StreetNumber>
            <StreetPreDirection>North</StreetPreDirection>
            <StreetName>TELLERO</StreetName>
            <StreetSuffix>DR</StreetSuffix>
            <UnitDesignation>Apt</UnitDesignation>
            <UnitNumber>1</UnitNumber>
            <City>GREENWATER</City>
            <State>FL</State>
            <Zip5>93840</Zip5>
          </Address>
          <SSN>773850198</SSN>
          <DOB>
            <Year>1939</Year>
            <Month>10</Month>
            <Day>16</Day>
          </DOB>
        </ReportBy>"
      }

      it "#report_by returns valid report_by xml" do
        expect(Nokogiri::XML(subject.report_by)).to be_equivalent_to(Nokogiri::XML(expected_report_by))
      end
    end

    context "unparsed parameters supplied to initialize" do
      let (:report_by) { 
        {
          name: {
            full: "SIDNEY HIRSCH ALEXERO",
          },
          address: {
            street_address_1: "97 TELLERO DR.",
            street_address_2: "Apt 1",
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
      }

      subject { PaynetApi::BpsReport::Request.new({}, {}, report_by) }

      let (:expected_report_by) {"
        <ReportBy>
          <Name>
            <Full>SIDNEY HIRSCH ALEXERO</Full>
            <First/>
            <Middle/>
            <Last/>
          </Name>
          <Address>
            <StreetAddress1>97 TELLERO DR.</StreetAddress1>
            <StreetAddress2>Apt 1</StreetAddress2>
            <StreetNumber/>
            <StreetPreDirection/>
            <StreetName/>
            <StreetSuffix/>
            <UnitDesignation/>
            <UnitNumber/>
            <City>GREENWATER</City>
            <State>FL</State>
            <Zip5>93840</Zip5>
          </Address>
          <SSN>773850198</SSN>
          <DOB>
            <Year>1939</Year>
            <Month>10</Month>
            <Day>16</Day>
          </DOB>
        </ReportBy>"
      }

      it "#report_by returns valid report_by xml" do
        expect(Nokogiri::XML(subject.report_by)).to be_equivalent_to(Nokogiri::XML(expected_report_by))
      end
    end

    context "no dob is provided" do
      let (:report_by) { 
        {
          name: {
            full: "SIDNEY HIRSCH ALEXERO",
          },
          address: {
            street_address_1: "97 TELLERO DR.",
            street_address_2: "Apt 1",
            city: "GREENWATER",
            state: "FL",
            zip5: "93840"
          },
          ssn: "773850198"
        }
      }

      subject { PaynetApi::BpsReport::Request.new({}, {}, report_by) }

      let (:expected_report_by) {"
        <ReportBy>
          <Name>
            <Full>SIDNEY HIRSCH ALEXERO</Full>
            <First/>
            <Middle/>
            <Last/>
          </Name>
          <Address>
            <StreetAddress1>97 TELLERO DR.</StreetAddress1>
            <StreetAddress2>Apt 1</StreetAddress2>
            <StreetNumber/>
            <StreetPreDirection/>
            <StreetName/>
            <StreetSuffix/>
            <UnitDesignation/>
            <UnitNumber/>
            <City>GREENWATER</City>
            <State>FL</State>
            <Zip5>93840</Zip5>
          </Address>
          <SSN>773850198</SSN>
        </ReportBy>"
      }

      it "#report_by returns valid report_by xml" do
        expect(Nokogiri::XML(subject.report_by)).to be_equivalent_to(Nokogiri::XML(expected_report_by))
      end
    end

  end

  pending "borrower's name and address produces valid request xml"
  pending "parsed vs un parsed versions of address"
  pending "parsed vs un parsed versions of name"
  pending "parsed vs un parsed versions of ssn"

  pending "suffixes"
  pending "removed n/a elements"

  describe '#as_xml' do
    context "no parameters supplied to initialize" do
      let (:expected_xml) { "
        <User>
          <ReferenceCode/>
          <BillingCode/>
          <QueryId/>
          <GLBPurpose/>
          <DLPurpose/>
          <AccountNumber/>
        </User>
        <Options>
          <IncludeMotorVehicles>1</IncludeMotorVehicles>
          <IncludeProperties>1</IncludeProperties>
          <IncludeWaterCrafts>1</IncludeWaterCrafts>
        </Options>
        <ReportBy>
          <Name>
            <First>JOHN</First>
            <Middle>HIRSCH</Middle>
            <Last>ALEXERO</Last>
            <Suffix></Suffix>
          </Name>
          <Name>
            <Full>JOHN HIRSCH ALEXERO</Full>
          </Name>
          <Address>
            <StreetNumber>97</StreetNumber>
            <StreetPreDirection/>
            <StreetName>TELLERO</StreetName>
            <StreetSuffix>DR</StreetSuffix>
            <UnitDesignation/>
            <UnitNumber/>
            <City>GREENWATER</City>
            <State>FL</State>
            <Zip5>93840</Zip5>
          </Address>
          <Address>
            <StreetAddress1/>
            <StreetAddress2/>
            <StateCityZip/>
          </Address>
          <SSN>773850198</SSN>
          <DOB>
            <Year>1939</Year>
            <Month>10</Month>
            <Day>16</Day>
          </DOB>
          <Phone10/>
          <CompanyName/>
          <BusinessPhone/>
        </ReportBy>"}

      it "#as_xml returns valid request xml" do
        expect(Nokogiri::XML(subject.as_xml)).to be_equivalent_to(Nokogiri::XML(expected_xml))
      end
    end
  end


  describe '#wsdl' do
    subject { PaynetApi::BpsReport::Request.new.wsdl }
    context 'base_url is set to http://dtrump.com' do
      before { PaynetApi::Config.base_url = "http://dtrump.com"}
      it { is_expected.to eq("http://dtrump.com/WsAccurintPeople?wsdl") }
    end
    context 'base_url is nil' do
      before { PaynetApi::Config.base_url = nil}
      it { is_expected.to eq("/WsAccurintPeople?wsdl") }
    end
  end
  
end
