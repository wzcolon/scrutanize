class ContractAuditor < Scrutanize::Auditor
  def records_to_audit
    Contract.all
  end

  def valid_record?(contract)
    contract.contract_dependency.present?
  end

  def audit_error_message
    "Contract does not have a dependency"
  end
end
