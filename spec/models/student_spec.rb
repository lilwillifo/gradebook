require 'rails_helper'

describe Student, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
  end
  context 'relationships' do
    it { should have_many :enrollments }
    it { should have_many :courses }
  end
end
