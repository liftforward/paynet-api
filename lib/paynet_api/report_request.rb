module PaynetApi
  class ReportRequest < PaynetApi::BaseRequest
    attr_accessor :paynet_id, :payment_comprehensive, :business_background, :public_filings, :ucc_filings, :legal_name, :transpo_score, :office_score, :constr_score, :master_score, :expanded_vars

    def initialize(paynet_id:, payment_comprehensive: nil, business_background: nil, public_filings: nil, ucc_filings: nil, legal_name: nil, transpo_score: nil, office_score: nil, constr_score: nil, master_score: nil, expanded_vars: nil)
      @paynet_id = paynet_id
      @payment_comprehensive = payment_comprehensive
      @business_background = business_background
      @public_filings = public_filings
      @ucc_filings = ucc_filings
      @legal_name = legal_name
      @transpo_score = transpo_score
      @office_score = office_score
      @constr_score = constr_score
      @master_score = master_score
      @expanded_vars = expanded_vars

      raise ArgumentError, "You must pass in a value for at least one of the following params: payment_comprehensive, business_background, public_filings, ucc_filings, legal_name, transpo_score, office_score, constr_score, master_score, or expanded_vars" if no_reports_requested?
    end

    def format
      nil
    end

    def params
      { version: '0320',
        paynet_id: paynet_id,
        payment_comprehensive: payment_comprehensive,
        business_background: business_background,
        public_filings: public_filings,
        ucc_filings: ucc_filings,
        legal_name: legal_name,
        transpo_score: transpo_score,
        office_score: office_score,
        constr_score: constr_score,
        master_score: master_score,
        expanded_vars: expanded_vars,
        format: format
      }
    end

    private
    def no_reports_requested?
      (@payment_comprehensive || @business_background || @public_filings || @ucc_filings || @legal_name || @transpo_score || @office_score || @constr_score || @master_score || @expanded_vars) == nil
    end
  end
end
