require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'testUser', email: 'test@123.com', password: 'password') }
  before { subject.save }

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'email should contain "@" char' do
    subject.email = 'abc.com'
    expect(subject).to_not be_valid
  end
end
