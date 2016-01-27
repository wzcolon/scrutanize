require 'rails_helper'

describe Scrutanize::Auditor do
  describe '#records_to_audit' do
    specify 'raises an error' do
      expect { described_class.new.records_to_audit }.to raise_error('audit classes must implement this method')
    end
  end

  describe '#valid_record?' do
    let(:klass) { Class.new }

    specify 'raises an error' do
      expect { described_class.new.valid_record?(klass) }.to raise_error('audit classes must specify how to validate the record')
    end
  end

  describe '#audit_errors' do
    specify 'returns an empty array' do
      expect(described_class.new.audit_errors).to eq []
    end
  end

  describe '#audit_error_message' do
    specify 'raises an error' do
      expect { described_class.new.audit_error_message }.to raise_error('audit classes must specify what the error message should be')
    end
  end
end
