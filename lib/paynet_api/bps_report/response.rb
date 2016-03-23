module PaynetApi
  module BpsReport
    class Response < PaynetApi::BaseResponse
  
      NameSpace = "wwse"
      URL = "http://webservices.seisint.com/WsAccurintPeople"

      def success?
       response_xml && individual_not_empty?
      end

      def error?
        !self.response_xml.xpath("//soap:Fault", {"soap" => "http://schemas.xmlsoap.org/soap/envelope/"}).empty?
      end

      def not_found?
        individual_empty?
      end
        
      def as_xml
        response_xml
      end

      def bankruptcies
        list_from(individual.bankruptcies_.bankruptcy)
      end

      def ucc_filings
        list_from(individual.ucc_filings_.ucc_filing)
      end

      def criminal_records
        list_from(individual.criminal_records_.criminal)
      end

      def liens_judgments
        list_from(individual.liens_judgments_.lien_judgment)
      end

      def akas
        list_from individual.ak_as_.identity
      end
      
      def properties
        list_from individual.properties_.property
      end

      def controlled_substances
        list_from individual.controlled_substances_.controlled_substance
      end


      def bps_report_response_ex
        @bps_report_response_ex ||= Hashie::Mash.new(nori.parse(report_xml)).bps_report_response_ex_
      end

      private

      def report_xml
        @response_xml.xpath("//#{NameSpace}:BpsReportResponseEx", {NameSpace => URL}).to_xml
      end
      
      def individual
        @individual ||= Hashie::Mash.new bps_report_response_ex.response_.individual_
      end

      def list_from hashies
        [hashies].flatten.compact
      end

      def individual_empty?
        self.response_xml.xpath("//#{NameSpace}:Individual", {NameSpace => URL}).children.empty?
      end

      def individual_not_empty?
        !individual_empty?
      end

    end
  end
end
