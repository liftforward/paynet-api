module SampleData

  CriminalRecords = [
    {
      :ssn=>"77302xxxx",
      :address=> {
        :state=>"AK"
      },
      :case_number=>"4DJ-225329T1198396",
      :name=>
      {
        :last=>"TEMURALI",
        :first=>"LARRY"
      },
      :unique_id=>"999915523688",
      :offender_id=>"094DJ-03T1198396",
      :offenses=>
      {
        :offense=>
        {
          :court=>
          {
            :case_number=>"4DJ-03T1198396",
            :disposition_date=>
            {
              :year=>"2003",
              :day=>"22",
              :month=>"04"
            },
            :disposition=>"No Contest Plea",
            :statute=>"Speeding",
            :description=>"Fourth District - Delta Jct"
          }
        }
      },
      :case_type_description=>"Minor Offense",
      :case_filing_date=>
      {
        :year=>"2003",
        :day=>"23",
        :month=>"09"
      },
      :state_of_origin=>"Alaska",
      :data_source=>"Criminal Court"
    }, 
    {
      :ssn=>"77302xxxx",
      :address=>
      {
        :state=>"AK"
      },
      :case_number=>"3AN-948185A1177629",
      :name=>
      {
        :last=>"TEMURALI",
        :first=>"LARRY",
        :middle=>"D"
      },
      :unique_id=>"999915523688",
      :offender_id=>"093AN-99A1177629",
      :offenses=>
      {
        :offense=>
        {
          :court=>
          {
            :case_number=>"3AN-99A1177629",
            :disposition_date=>
            {
              :year=>"1999",
              :day=>"01",
              :month=>"07"
            },
            :statute=>"STOP FOR STEADY RED",
            :description=>"Third District - Anchorage"
          }
        }
      },
      :case_type_description=>"Minor Offense",
      :case_filing_date=>
      {
        :year=>"1999",
        :day=>"05",
        :month=>"09"
      },
      :state_of_origin=>"Alaska",
      :data_source=>"Criminal Court"
    }
  ].map{|b| Hashie::Mash.new b }
end
