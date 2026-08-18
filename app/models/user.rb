class User < ApplicationRecord

  # macro that adds password functionality. Available via bcrypt gem.
  has_secure_password

  # one_to_many. Each user has many sessions and tweets.
  has_many :sessions, dependent: :destroy
  has_many :tweets, dependent: :destroy

  # normalizes email address to lowercase and strips whitespace.
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # validates username presence, uniqueness, length, and format.
  validates :username, presence: true,
                       uniqueness: {case_sensitive: false},
                      length: {in: 3..20},
                      format: {with: /\A[a-zA-Z0-9_]+\z/, message: "only letters, numbers, and _"}
end
