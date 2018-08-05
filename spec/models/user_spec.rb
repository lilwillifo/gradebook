require 'rails_helper'

describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end
  describe 'roles' do
    it 'can be created as an teacher' do
      user = User.create(username: 'Boo', password: 'ya', role: 1)

      expect(user.role).to eq('teacher')
      expect(user.teacher?).to be_truthy
    end

    it 'can be created as a default user, student' do
      user = User.create(username: 'name', password: 'pass')

      expect(user.role).to eq('student')
      expect(user.student?).to be_truthy
    end

    it 'can be created as an admin' do
      user = User.create(username: 'admin', password: 'woo', role: 2)

      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end
  end
end
