class User < ActiveRecord::Base
  validations :email, presence: true, uniqueness: true
end
