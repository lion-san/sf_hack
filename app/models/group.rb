class Group < ActiveRecord::Base
  validates :group_name, presence: true, length: { maximum: 140 }
  validates :group_detail, presence: true, length: { maximum: 1000 }
end
