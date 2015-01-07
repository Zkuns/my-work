class Company < ActiveRecord::Base
  has_many :items
  has_many :users
  has_many :games
end
