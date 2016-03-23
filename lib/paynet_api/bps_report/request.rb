module PaynetApi
  module BpsReport
    class Request < PaynetApi::BaseRequest
      # attr_accessor :user, :options, :report_by

      #TODO make the inclusion or not of the DEMO in the url controlled by some switch
      def wsdl
        "#{base_url}/WsAccurintPeople?wsdl"
      end

      def initialize user = {}, options = {}, report_by = {}
        #TODO make this take a hash or multiple hashes to use as arguments to xml generation
        self.initialize_user(user)
        self.initialize_options(options)
        self.initialize_report_by(report_by)
      end

      def initialize_user user
        @user = {}.deep_merge(user)

        #   reference_code: "",
        #   billing_code: "",
        #   business: {
        #     name: "",
        #     address: "",
        #     city: "",
        #     stateabbrev: "",
        #     zip: ""
        #   }
        # }
      end

      def initialize_options options
        @options = {}.merge(options)

        # { include_bankruptcies: "",
        #   include_liens_judgments: "",
        #   include_ucc_filings: "",
        #   include_criminal_records: ""}.merge(options)
      end

      # there's a deep_merge or recursive merge laying around here somewhere...
      def initialize_report_by report_by
        @report_by = {}.merge(report_by)

        # { name: { first: "", middle: "", last: ""},
        #   address: { street_number: "",
        #     street_pre_direction: "",
        #     street_name: "",
        #     street_suffix: "",
        #     unit_designation: "",
        #     unit_number: "",
        #     city: "",
        #     state: "",
        #     zip5: ""},
        #   ssn: "",
        #   dob: { year: "", month: "", day: ""}}.deep_merge(report_by)
      end

      def as_xml
        user
        options
        report_by

        builder.target!
      end

      def user
        builder.User do
          #code the we provide to reference something of ours, like loan id
          builder.ReferenceCode @user[:reference_code]
          #friendlier version of our ID
          builder.BillingCode @user[:billing_code]
          #id for this query which we can use to disambiguate multiple results
          builder.QueryId @user[:query_id]             #"Ajax123"
          builder.GLBPurpose @user[:glb_purpose]       #"11"
          builder.DLPurpose @user[:dl_purpose]         #"3"
          builder.AccountNumber @user[:account_number] #"S12345"

          #name of company from loan application
          if business = @user[:business]
            builder.EndUser do
              builder.CompanyName business[:name]
              builder.StreetAddress1 business[:address]
              builder.City business[:city]
              builder.State business[:stateabbrev]
              builder.Zip5 business[:zip]
            end
          end
        end
      end

      #optional, not sure what this does yet
      def options
        builder.Options do
          builder.IncludeAKAs bool_to_bit(@options[:include_akas])
          builder.IncludeImposters bool_to_bit(@options[:include_imposters])
          builder.IncludeOldPhones bool_to_bit(@options[:include_old_phones])
          builder.IncludeAssociates bool_to_bit(@options[:include_associates])
          builder.IncludeProperties bool_to_bit(@options[:include_properties])
          builder.IncludePriorProperties bool_to_bit(@options[:include_prior_properties])
          builder.IncludeCurrentProperties bool_to_bit(@options[:include_current_properties])
          builder.IncludeDriversLicenses bool_to_bit(@options[:include_drivers_licenses])
          builder.IncludeMotorVehicles bool_to_bit(@options[:include_motor_vehicles])
          builder.IncludeBankruptcies bool_to_bit(@options[:include_bankruptcies])
          builder.IncludeLiensJudgments bool_to_bit(@options[:include_liens_judgments])
          builder.IncludeCorporateAffiliations bool_to_bit(@options[:include_corporate_affiliations])
          builder.IncludeUCCFilings bool_to_bit(@options[:include_ucc_filings])
          builder.IncludeFAACertificates bool_to_bit(@options[:include_faa_certificates])
          builder.IncludeCriminalRecords bool_to_bit(@options[:include_criminal_records])
          builder.IncludeCensusData bool_to_bit(@options[:include_census_data])
          builder.IncludeAccidents bool_to_bit(@options[:include_accidents])
          builder.IncludeWaterCrafts bool_to_bit(@options[:include_water_crafts])
          builder.IncludeProfessionalLicenses bool_to_bit(@options[:include_professional_licenses])
          builder.IncludeHealthCareSanctions bool_to_bit(@options[:include_health_care_sanctions])
          builder.IncludeDEAControlledSubstance bool_to_bit(@options[:include_dea_controlled_substance])
          builder.IncludeVoterRegistrations bool_to_bit(@options[:include_voter_registrations])
          builder.IncludeHuntingFishingLicenses bool_to_bit(@options[:include_hunting_fishing_licenses])
          builder.IncludeFirearmExplosives bool_to_bit(@options[:include_firearm_explosives])
          builder.IncludeWeaponPermits bool_to_bit(@options[:include_weapon_permits])
          builder.IncludeSexualOffenses bool_to_bit(@options[:include_sexual_offenses])
          builder.IncludeFAAAircrafts bool_to_bit(@options[:include_faa_aircrafts])
          builder.IncludePeopleAtWork bool_to_bit(@options[:include_people_at_work])
          builder.IncludeHighRiskIndicators bool_to_bit(@options[:include_high_risk_indicators])
          builder.IncludeForeclosures bool_to_bit(@options[:include_foreclosures])
          builder.IncludePhonesPlus bool_to_bit(@options[:include_phones_plus])
          builder.IncludeSourceDocs bool_to_bit(@options[:include_source_docs])
          builder.IncludeBestInfo bool_to_bit(@options[:include_best_info])
          builder.IncludeDriversAtAddress bool_to_bit(@options[:include_drivers_at_address])
          builder.IncludeGlobalWatchLists bool_to_bit(@options[:include_global_watch_lists])
          builder.IncludeRealTimeVehicles bool_to_bit(@options[:include_real_time_vehicles])
          builder.IncludeFictitiousBusinesses bool_to_bit(@options[:include_fictitious_businesses])
          builder.IncludeNoticeOfDefaults bool_to_bit(@options[:include_notice_of_defaults])
          builder.EnableNationalAccidents bool_to_bit(@options[:enable_national_accidents])
          builder.EnableExtraAccidents bool_to_bit(@options[:enable_extra_accidents])
          builder.AcceptedNonSolicitationTerms bool_to_bit(@options[:accepted_non_solicitation_terms])
          builder.IncludeEmailAddresses bool_to_bit(@options[:include_email_addresses])
          builder.IncludeVerification bool_to_bit(@options[:include_verification])
          builder.IncludePhoneSummary bool_to_bit(@options[:include_phone_summary])
          builder.IncludeStudentInformation bool_to_bit(@options[:include_student_information])
          builder.IncludeNonRegulatedVehicleSources bool_to_bit(@options[:include_non_regulated_vehicle_sources])
          builder.IncludeNonRegulatedWatercraftSources bool_to_bit(@options[:include_non_regulated_watercraft_sources])
          
          #TODO verify provided real time permissible use code is valid
          # [Government | LawEnforcement | Parking | VerifyFraudOrDebt | Litigation | InsuranceClaims | InsuranceUnderwriting | TowedAndImpounded | PrivateToll | PrivateInvestigative | PrivateInvestigativeLitigation | EmployerVerify]
          builder.RealTimePermissibleUse @options[:real_time_permissible_use]

          builder.MaxAddresses int_or_nil(@options[:max_addresses])
          builder.MaxSubjectAddresses int_or_nil(@options[:max_subject_addresses])

          if relatives = @options[:relatives]
            builder.Relatives do
              builder.IncludeRelatives bool_to_bit(relatives[:include_relatives])
              builder.IncludeRelativeAddresses bool_to_bit(relatives[:IncludeRelativeAddresses])
              builder.MaxRelatives int_or_nil(relatives[:max_relatives])
              builder.RelativeDepth int_or_nil(relatives[:relative_depth])
              builder.MaxRelativeAddresses int_or_nil(relatives[:max_relative_addresses])
            end
          end

          if neighbors = @options[:neighbors]
            builder.Neighbors do
              builder.IncludeNeighbors bool_to_bit(neighbors[:include_neighbors])
              builder.IncludeHistoricalNeighbors bool_to_bit(neighbors[:include_historical_neighbors])
              builder.NeighborhoodCount int_or_nil(neighbors[:neighborhood_count])
              builder.NeighborCount int_or_nil(neighbors[:neighbor_count])
            end
          end

          if health_care_providers = @options[:health_care_providers]
            builder.HealthCareProviders do
              builder.IncludeHealthCareProviders bool_to_bit(health_care_providers[:include_health_care_providers])
              builder.IncludeGroupAffiliations bool_to_bit(health_care_providers[:include_group_affiliations])
              builder.IncludeHospitalAffiliations bool_to_bit(health_care_providers[:include_hospital_affiliations])
              builder.IncludeEducation bool_to_bit(health_care_providers[:include_education])
              builder.IncludeBusinessAddress bool_to_bit(health_care_providers[:include_business_address])
            end
          end

        end
      end

      def bool_to_bit value
        value ? "1" : "0"
      end

      def int_or_nil value
        value.to_id unless value.nil?
      end

      def report_by
        builder.ReportBy do

          if name = @report_by[:name]
            builder.Name do
              builder.Full name[:full]
              builder.First name[:first]
              builder.Middle name[:middle]
              builder.Last name[:last]
            end
          end

          if address = @report_by[:address]
            builder.Address do
              builder.StreetAddress1 address[:street_address_1]
              builder.StreetAddress2 address[:street_address_2]
              builder.StreetNumber address[:street_number]
              builder.StreetPreDirection address[:street_pre_direction]
              builder.StreetName address[:street_name]
              builder.StreetSuffix address[:street_suffix]
              builder.UnitDesignation address[:unit_designation]
              builder.UnitNumber address[:unit_number]
              builder.City address[:city]
              builder.State address[:state]
              builder.Zip5 address[:zip5]
            end
          end

          builder.SSN @report_by[:ssn]

          if dob = @report_by[:dob]
            builder.DOB do
              builder.Year dob[:year]
              builder.Month dob[:month]
              builder.Day dob[:day]
            end
          end
        end
      end

      def builder
        @builder ||= Builder::XmlMarkup.new(indent: 2)
      end
    end
  end
end
