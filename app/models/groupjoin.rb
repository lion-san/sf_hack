class Groupjoin < ActiveRecord::Base
  belongs_to :group, class_name: "Group"
  validates :user_id, presence: true
  validates :group_id, presence: true

  
end
