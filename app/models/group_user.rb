class GroupUser < ActiveRecord::Base
  belong_to :user
  belong_to :group
end
