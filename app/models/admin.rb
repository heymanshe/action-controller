require "bcrypt"

class Admin < ApplicationRecord
  has_secure_password
end
