module SampleData

  ControlledSubstances = [
    {"registration_number"=>"AC3538608",
         "controlled_substances_info"=>
          {"controlled_substance_info"=>
            [{"drug_schedules"=>"22N 33N 4 5",
              "name"=>
               {"last"=>"CARRMORE",
                "first"=>"ADNAN",
                "suffix"=>"MD",
                "prefix"=>"MR",
                "middle"=>"HALIM"},
              "address"=>
               {"street_name"=>"CARRIN",
                "city"=>"GARBVILLE",
                "state"=>"MI",
                "street_number"=>"44555",
                "zip5"=>"88911",
                "zip4"=>"5032",
                "street_suffix"=>"AVE"},
              "expiration_date"=>{"day"=>"09", "month"=>"06", "year"=>"2011"},
              "business_type"=>"PRACTITIONER"},
             {"drug_schedules"=>"22N 33N 4 5",
              "name"=>
               {"last"=>"CARRMORE",
                "first"=>"ADNAN",
                "suffix"=>"MD",
                "prefix"=>"MR",
                "middle"=>"HALIM"},
              "address"=>
               {"street_name"=>"CARRIN",
                "city"=>"GARBVILLE",
                "state"=>"MI",
                "street_number"=>"44555",
                "zip5"=>"88911",
                "zip4"=>"5032",
                "street_suffix"=>"AVE"},
              "expiration_date"=>{"day"=>"09", "month"=>"06", "year"=>"2008"},
              "business_type"=>"PRACTITIONER"},
             {"ssn"=>"77397xxxx",
              "drug_schedules"=>"22N 33N 4 5",
              "name"=>
               {"last"=>"CARRMORE",
                "first"=>"ADNAN",
                "suffix"=>"MD",
                "prefix"=>"MR",
                "middle"=>"HALIM"},
              "address"=>
               {"street_name"=>"ALIIN",
                "city"=>"ZETAROCK",
                "state"=>"MI",
                "street_number"=>"14711",
                "zip5"=>"53146",
                "zip4"=>"3040",
                "street_suffix"=>"RD"},
              "expiration_date"=>{"day"=>"09", "month"=>"06", "year"=>"2005"},
              "business_type"=>"PRACTITIONER"}]}}

  ].map{|b| Hashie::Mash.new(b)}


end

