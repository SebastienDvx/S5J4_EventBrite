class Event < ApplicationRecord

# Source : http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
has_and_belongs_to_many :attendees, class_name: "User"

validates :title, presence: true
validates :description, presence: true
validates :date, presence: true
validates :place, presence: true

end
