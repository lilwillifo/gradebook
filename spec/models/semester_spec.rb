require 'rails_helper'

describe Semester, type: :model do
  context 'validations' do
    it { should validate_presence_of(:session) }
    it { should validate_presence_of(:year) }
  end
  describe 'sessions' do
    it 'can be fall, summer, or spring' do
      fall = Semester.create!(session: 0, year: 2018)
      spring = Semester.create(session: 1, year: 2018)
      summer = Semester.create(session: 2, year: 2018)

      expect(fall.fall?).to be_truthy
      expect(summer.summer?).to be_truthy
      expect(spring.spring?).to be_truthy
    end
  end
end
