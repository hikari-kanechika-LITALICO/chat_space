class Group < ActiveRecord::Base
  has_many :users, through: :group_users
  has_many :massages
  has_many :group_users
end
