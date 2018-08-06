require 'rails_helper'

describe Enrollment, type: :model do
  context 'relationships' do
    it { should belong_to :course }
    it { should belong_to :student }
  end
end
