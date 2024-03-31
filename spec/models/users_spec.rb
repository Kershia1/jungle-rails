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

  # email should be unique (not case sensitive)
    it 'should not save the user when email is not unique' do
      @user_1 = User.new(name: 'Jane', email: 'j.doe.smith@yahoo.com'.downcase, password: 'passwordZ0', password_confirmation: 'passwordZ0')
      @user_1.save
      @user_2 = User.new(name: 'Joey', email: 'J.DOE.SMITH@YAHOO.COM'.downcase, password: 'password0', password_confirmation: 'password0')
      @user_2.save
      expect(@user_2.errors.full_messages).to include("Email has already been taken")
    end

    #  Define a new class method authenticate_with_credentials on the User model
    #  This method will take the email and password from the params and return the user if the user exists and the password is correct
    #  Otherwise, it will return nil

    describe '.authenticate_with_credentials' do
      it 'should log-in user only when credentials are valid' do
      @user = User.new(name: 'Jane', email: 'j.doe.smith@yahoo.com', password: 'passwordZ0', password_confirmation: 'passwordZ0')
      @user.save
      @user_logged_in = User.authenticate_with_credentials('j.doe.smith@yahoo.com', 'passwordZ0')
      expect(@user_logged_in).to_not be_nil
     end

# Edge cases to consider:
# email has white spaces around it
    end
  end
end
