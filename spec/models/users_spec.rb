require 'rails_helper'

RSpec.describe Users, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
# define validations specs for the User model

# password and password_confirmation should match

# email should be unique (not case sensitive)

#  Define a new class method authenticate_with_credentials on the User model

# Edge cases to consider:
# email has white spaces around it
# email is in different cases