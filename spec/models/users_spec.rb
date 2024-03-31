require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

  # define validations specs for the User model
    it 'should save a new user only when all required fields are filled' do
      @user = User.new(name: 'Jane', email: 'j.doe.smith@yahoo.com', password: 'passwordZ0', password_confirmation: 'passwordZ0')
      expect(@user).to be_valid
    end

  # password and password_confirmation should match
    it 'should not save a new user when password and password_confirmation do not match' do
      @user = User.new(name: 'Jane', email: 'j.doe.smith@yahoo.com', password: 'passwordZ0', password_confirmation: 'password')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end

# email should be unique (not case sensitive)

#  Define a new class method authenticate_with_credentials on the User model

# Edge cases to consider:
# email has white spaces around it
# email is in different cases