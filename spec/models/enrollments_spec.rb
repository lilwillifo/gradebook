require 'rails_helper'

describe Enrollment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:grade) }
  end
  context 'relationships' do
    it { should belong_to :course }
    it { should belong_to :student }
  end
end
