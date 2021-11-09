class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save{email.downcase!}
  validates :name, presence: true,
                  length: {maximum: Settings.length.name}
  validates :email, presence: true,
                    length: {maximum: Settings.length.email},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
  validates :password, presence: true,
                      length: {minimum: Settings.length.password}

  has_secure_password
end
