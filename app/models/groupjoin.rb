class Groupjoin < ActiveRecord::Base
  validates :user_id, presence: true
  validates :group_id, presence: true
end
