class User < ApplicationRecord
  has_many :runs, dependent: :destroy

  has_secure_password
end
