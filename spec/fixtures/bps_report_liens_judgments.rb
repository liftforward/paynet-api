module SampleData
  LiensJudgments = [
  {:case_number=>"SC-00003449-3994-", :origin_filing_date=>{:day=>"10", :month=>"11", :year=>"1994"}, :filing_status=>"OPEN", :debtors=>{:debtor=>{:addresses=>{:address=>{:zip5=>"60520", :zip4=>"1593", :street_name=>"PETERERO", :city=>"ZETAROCK", :county=>"WAYNE", :state=>"MI"}}, :parsed_parties=>{:party=>{:ssn=>"77397xxxx", :name=>{:last=>"CARRMORE", :prefix=>"MR", :first=>"ADNAN"}, :unique_id=>"999915664205", :person_filter_id=>"688154939"}}, :origin_name=>"ADNAN  CARRMORE"}}, :filing_jurisdiction=>"PA", :filings=>{:filing=>{:type=>"CIVIL SUIT", :origin_filing_date=>{:day=>"10", :month=>"11", :year=>"1994"}, :agency_state=>"PA", :number=>"9403449", :agency=>"COURT OF COMMON PLEAS", :agency_county=>"MONTGOMERY"}}, :multiple_defendant=>false, :filing_jurisdiction_name=>"PENNSYLVANIA", :tms_id=>"SUDPASC000032491994005001123496580"}
  ].map{|b| Hashie::Mash.new b } 
end
