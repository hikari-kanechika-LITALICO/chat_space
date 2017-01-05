class Group < ActiveRecord::Base
  has_many :users, through: :group_users
  has_many :messages
  has_many :group_users
end
