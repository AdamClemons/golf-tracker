class User < ActiveRecord::Base
    has_secure_password
    has_many :user_clubs
    has_many :clubs, through: :user_clubs
    has_many :scores
    belongs_to :course
end