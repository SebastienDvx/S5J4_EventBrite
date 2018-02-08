class Event < ApplicationRecord

has_and_belongs_to_many :users

validates :title, presence: true
validates :description, presence: true
validates :date, presence: true
validates :place, presence: true



end
