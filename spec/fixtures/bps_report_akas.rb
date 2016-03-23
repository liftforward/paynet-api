module SampleData
  Akas = [
    {
      "name"=> {
        "last"=>"CARRMORE", "first"=>"ADENAN", "suffix"=>"UN1", "middle"=>"H"},
        "is_current_name"=>"1",
        "is_correct_dob"=>"1",
        "subject_ssn_indicator"=>"yes",
        "driver_licenses"=>
        {
          "driver_license"=> [
            {
              "ssn"=>"77397XXXX",
              "address"=> {
                "street_name"=>"DESA",
                "city"=>"LEDFOREST",
                "county"=>"OAKLAND",
                "state"=>"MI",
                "street_number"=>"6181",
                "zip5"=>"38071",
                "street_address1"=>"6181 DESA",
                "zip4"=>"1565",
                "street_suffix"=>"CIR"},
                "date_first_seen"=>{
                  "month"=>"09", "year"=>"2003"},
                  "history"=>"Historical",
                  "driver_license"=>"XXXXXXXXXXXXXX",
                  "origin_state_name"=>"Michigan",
                  "non_dmv_source"=>"N",
                  "date_last_seen"=>{
                    "month"=>"09", "year"=>"2003"},
                    "name"=> {
                      "full"=>"ADNAN HALIM CARRMORE",
                      "last"=>"CARRMORE",
                      "first"=>"ADNAN",
                      "prefix"=>"MR",
                      "middle"=>"HALIM"},
                      "license_type"=>"OPERATORS",
                      "dob"=>{
                        "day"=>"16", "month"=>"06", "year"=>"1944"},
                        "sex"=>"Male",
                        "origin_state"=>"MI",
                        "unique_id"=>"999915664205"},
                        {
                          "ssn"=>"77397XXXX",
                          "address"=> {
                            "street_pre_direction"=>"N",
                            "street_name"=>"NORDART",
                            "city"=>"GAGLEPARK",
                            "county"=>"OAKLAND",
                            "state"=>"MI",
                            "street_number"=>"381",
                            "zip5"=>"96939",
                            "street_address1"=>"381 NORDART",
                            "zip4"=>"5331",
                            "street_suffix"=>"AVE"},
                            "date_first_seen"=>{
                              "month"=>"04", "year"=>"2007"},
                              "history"=>"Current",
                              "driver_license"=>"XXXXXXXXXXXXXX",
                              "origin_state_name"=>"Michigan",
                              "non_dmv_source"=>"N",
                              "date_last_seen"=>{
                                "month"=>"04", "year"=>"2007"},
                                "name"=> {
                                  "full"=>"ADNAN HALIM CARRMORE",
                                  "last"=>"CARRMORE",
                                  "first"=>"ADNAN",
                                  "prefix"=>"MR",
                                  "middle"=>"HALIM"},
                                  "license_type"=>"OPERATORS",
                                  "dob"=>{
                                    "day"=>"16", "month"=>"06", "year"=>"1944"},
                                    "sex"=>"Male",
                                    "origin_state"=>"MI",
                                    "unique_id"=>"999915664205"}
          ]
        },
        "unique_id"=>"999915664205"
    },

    {
      "name"=> {
        "last"=>"CARRMORE", "first"=>"ADENAN", "suffix"=>"UN1", "middle"=>"H"},
        "is_current_name"=>"1",
        "is_correct_dob"=>"1",
        "subject_ssn_indicator"=>"yes",
        "driver_licenses"=>
        {
          "driver_license"=> [
            {
              "ssn"=>"77397XXXX",
              "address"=> {
                "street_name"=>"DESA",
                "city"=>"LEDFOREST",
                "county"=>"OAKLAND",
                "state"=>"MI",
                "street_number"=>"6181",
                "zip5"=>"38071",
                "street_address1"=>"6181 DESA",
                "zip4"=>"1565",
                "street_suffix"=>"CIR"},
                "date_first_seen"=>{
                  "month"=>"09", "year"=>"2003"},
                  "history"=>"Historical",
                  "driver_license"=>"XXXXXXXXXXXXXX",
                  "origin_state_name"=>"Michigan",
                  "non_dmv_source"=>"N",
                  "date_last_seen"=>{
                    "month"=>"09", "year"=>"2003"},
                    "name"=> {
                      "full"=>"ADNAN HALIM CARRMORE",
                      "last"=>"CARRMORE",
                      "first"=>"ADNAN",
                      "prefix"=>"MR",
                      "middle"=>"HALIM"},
                      "license_type"=>"OPERATORS",
                      "dob"=>{
                        "day"=>"16", "month"=>"06", "year"=>"1944"},
                        "sex"=>"Male",
                        "origin_state"=>"MI",
                        "unique_id"=>"999915664205"},
                        {
                          "ssn"=>"77397XXXX",
                          "address"=> {
                            "street_pre_direction"=>"N",
                            "street_name"=>"NORDART",
                            "city"=>"GAGLEPARK",
                            "county"=>"OAKLAND",
                            "state"=>"MI",
                            "street_number"=>"381",
                            "zip5"=>"96939",
                            "street_address1"=>"381 NORDART",
                            "zip4"=>"5331",
                            "street_suffix"=>"AVE"},
                            "date_first_seen"=>{
                              "month"=>"04", "year"=>"2007"},
                              "history"=>"Current",
                              "driver_license"=>"XXXXXXXXXXXXXX",
                              "origin_state_name"=>"Michigan",
                              "non_dmv_source"=>"N",
                              "date_last_seen"=>{
                                "month"=>"04", "year"=>"2007"},
                                "name"=> {
                                  "full"=>"ADNAN HALIM CARRMORE",
                                  "last"=>"CARRMORE",
                                  "first"=>"ADNAN",
                                  "prefix"=>"MR",
                                  "middle"=>"HALIM"},
                                  "license_type"=>"OPERATORS",
                                  "dob"=>{
                                    "day"=>"16", "month"=>"06", "year"=>"1944"},
                                    "sex"=>"Male",
                                    "origin_state"=>"MI",
                                    "unique_id"=>"999915664205"}
          ]
        },
        "unique_id"=>"999915664205"
    }
  ].map{|b| Hashie::Mash.new(b)}

end

