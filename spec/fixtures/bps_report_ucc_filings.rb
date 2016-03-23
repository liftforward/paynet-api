module SampleData

       UCCFilings =[
         {:debtors=>
          {:debtor=>
            {:addresses=>
              {:address=>
                {:orig_street_address1=>"8749 CLINTARZI",
                 :street_name=>"CLINTARZI",
                 :city=>"WOLFHILL",
                 :state=>"AK",
                 :street_number=>"8749",
                 :zip5=>"12042",
                 :zip4=>"5128",
                 :street_address1=>"8749 CLINTARZI ST",
                 :street_suffix=>"ST",
                 :street_address2=>"WOLFHILL, AK 12042"}},
             :parsed_parties=>
              {:party=>
                {:ssn=>"77302xxxx",
                 :name=>
                  {:last=>"TEMURALI", :first=>"LARRY", :prefix=>"MR", :middle=>"D"},
                 :business_ids=>
                  {:ult_id=>"0",
                   :powid=>"0",
                   :org_id=>"0",
                   :prox_id=>"0",
                   :emp_id=>"0",
                   :dot_id=>"0",
                   :sele_id=>"0"},
                 :unique_id=>"999915523688"}},
             :origin_name=>"TEMURALI, LARRY D"}},
         :origin_filing_date=>{:day=>"1", :month=>"3", :year=>"2002"},
         :origin_filing_number=>"4004-533459-3",
         :filings=>
          {:filing=>
            {:type=>"INITIAL FILING",
             :date=>{:day=>"1", :month=>"3", :year=>"2002"},
             :number=>"4004-533459-3"}},
         :filing_jurisdiction=>"AK",
         :collaterals=>
          {:collateral=>{:description=>"03/01/2002 4004-533459-3 - REAL PROPERTY"}},
         :filing_jurisdiction_name=>"ALASKA",
         :filing_offices=>
          {:office=>
            {:address=>
              {:zip5=>"99503",
               :street_address1=>"3601 C STREET STE 1140-A",
               :city=>"ANCHORAGE",
               :state=>"AK"},
             :filing_agency=>"SECRETARY OF STATE/UCC DIVISION"}},
         :tms_id=>"DNB2002-513259-320020304"},
        {:debtors=>
          {:debtor=>
            {:addresses=>
              {:address=>
                {:orig_street_address1=>"4640 AUGETTA",
                 :street_name=>"AUGETTA",
                 :city=>"WOLFHILL",
                 :state=>"AK",
                 :street_number=>"4640",
                 :zip5=>"12042",
                 :zip4=>"2722",
                 :street_address1=>"4640 AUGETTA DR",
                 :street_suffix=>"DR",
                 :street_address2=>"WOLFHILL, AK 12042"}},
             :parsed_parties=>
              {:party=>
                {:ssn=>"77302xxxx",
                 :name=>
                  {:last=>"TEMURALI", :first=>"LARRY", :prefix=>"MR", :middle=>"D"},
                 :business_ids=>
                  {:ult_id=>"0",
                   :powid=>"0",
                   :org_id=>"0",
                   :prox_id=>"0",
                   :emp_id=>"0",
                   :dot_id=>"0",
                   :sele_id=>"0"},
                 :unique_id=>"999915523688"}},
             :origin_name=>"TEMURALI, LARRY D"}},
         :origin_filing_date=>{:day=>"11", :month=>"4", :year=>"1994"},
         :origin_filing_number=>"383364",
         :filings=>
          {:filing=>
            {:type=>"INITIAL FILING",
             :date=>{:day=>"11", :month=>"4", :year=>"1994"},
             :number=>"383364"}},
         :filing_jurisdiction=>"AK",
         :collaterals=>
          {:collateral=>
            {:description=>
              "04/11/1994 383364 - RIGHT TITLE AND INTEREST                                                                                                                                                                                                                                  SPECIFIED"}},
         :filing_jurisdiction_name=>"ALASKA",
         :filing_offices=>
          {:office=>
            {:address=>
              {:zip5=>"99503",
               :street_address1=>"3601 C STREET STE 1140-A",
               :city=>"ANCHORAGE",
               :state=>"AK"},
             :filing_agency=>"SECRETARY OF STATE/UCC DIVISION"}},
         :tms_id=>"DNB38136219940414"},
        {:debtors=>
          {:debtor=>
            {:addresses=>
              {:address=>
                {:orig_street_address1=>"4640 AUGETTA",
                 :street_name=>"AUGETTA",
                 :city=>"WOLFHILL",
                 :state=>"AK",
                 :street_number=>"4640",
                 :zip5=>"12042",
                 :zip4=>"2722",
                 :street_address1=>"4640 AUGETTA DR",
                 :street_suffix=>"DR",
                 :street_address2=>"WOLFHILL, AK 12042"}},
             :parsed_parties=>
              {:party=>
                {:ssn=>"77302xxxx",
                 :name=>
                  {:last=>"TEMURALI", :first=>"LARRY", :prefix=>"MR", :middle=>"D"},
                 :business_ids=>
                  {:ult_id=>"0",
                   :powid=>"0",
                   :org_id=>"0",
                   :prox_id=>"0",
                   :emp_id=>"0",
                   :dot_id=>"0",
                   :sele_id=>"0"},
                 :unique_id=>"999915523688"}},
             :origin_name=>"TEMURALI, LARRY D"}},
         :origin_filing_date=>{:day=>"21", :month=>"7", :year=>"1993"},
         :origin_filing_number=>"934030348",
         :filings=>
          {:filing=>
            [{:type=>"CONTINUATION",
              :number=>"983370746",
              :date=>{:day=>"21", :month=>"4", :year=>"1998"},
              :expiration_date=>{:day=>"20", :month=>"7", :year=>"1998"}},
             {:type=>"INITIAL FILING",
              :number=>"934030348",
              :date=>{:day=>"21", :month=>"7", :year=>"1993"},
              :expiration_date=>{:day=>"20", :month=>"7", :year=>"1998"}}]},
         :filing_jurisdiction=>"WA",
         :collaterals=>
          {:collateral=>
            {:description=>
              "07/21/1993 934030348 - EQUIPMENT SPECIFIED AND PRODUCTS;BUILDING MATERIALS SPECIFIED AND PRODUCTS;MACHINERY SPECIFIED AND PRODUCTS;FIXTURES SPECIFIED AND PRODUCTS;UNITS                                                                                                                                                                                                                                                     SPECIFIED AND PRODUCTS"}},
         :filing_jurisdiction_name=>"WASHINGTON",
         :filing_offices=>
          {:office=>
            {:address=>
              {:zip5=>"98502",
               :street_address1=>"405 BLACK LAKE BLVD SE",
               :city=>"OLYMPIA",
               :state=>"WA"},
             :filing_agency=>"SECRETARY OF STATE/UCC DIVISION"}},
         :tms_id=>"DNB93201014819930720"}].map{|b| Hashie::Mash.new(b)}

end

