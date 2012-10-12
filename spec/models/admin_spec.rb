require 'spec_helper'

describe Admin do
  describe 'valid admin' do
    let(:admin) { create(:admin) }

    subject { admin }

    it { should be_valid }
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:remember_me) }
  end
end
