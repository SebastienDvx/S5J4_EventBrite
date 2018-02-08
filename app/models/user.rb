class User < ApplicationRecord

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

  validates :password, presence: true,
                       length: { minimum: 6 }

 # Source : http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
  has_many :created_events, class_name: "Event"
	has_and_belongs_to_many :attended_events, class_name: "Event"
end
