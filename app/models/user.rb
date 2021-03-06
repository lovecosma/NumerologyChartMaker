class User < ActiveRecord::Base
  has_many :numerology_charts
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
