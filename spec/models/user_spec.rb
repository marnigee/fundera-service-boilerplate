require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { 'wilma.flinstone@example.com' }
  let(:invalid_emails) do
    [
      'hi',
      'wilma.flinstone',
      'example.com'
    ]
  end

  context 'email validation' do
    it 'allows valid email' do
      valid_user = User.create(email: valid_email)

      expect(valid_user.errors).to_not be_present
    end

    it 'adds errors for invalid emails' do
      invalid_emails.map do |e|
        invalid_user = User.create(email: e)
        expect(invalid_user.errors).to be_present
      end
    end
  end
end
