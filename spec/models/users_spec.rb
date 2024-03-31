require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

    it 'should save a new user only when all required fields are filled' do
      @user = User.new(name: 'Jane', email: 'j.doe.smith@yahoo.com', password: 'passwordZ0', password_confirmation: 'passwordZ0')
      expect(@user).to be_valid
    end
  end
end




# define validations specs for the User model

# password and password_confirmation should match

# email should be unique (not case sensitive)

#  Define a new class method authenticate_with_credentials on the User model

# Edge cases to consider:
# email has white spaces around it
# email is in different cases