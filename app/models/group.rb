class Group < ActiveRecord::Base
  has_many :groupjoins, dependent: :destroy
  validates :group_name, presence: true, length: { maximum: 140 }
  validates :group_detail, presence: true, length: { maximum: 1000 }

  def join!(user)
    groupjoins.create!(user_id: user.id)
  end

  def unjoin(user)
    groupjoins.find_by(user_id: user.id).destroy
  end

  def joined?(user)
    groupjoins.find_by(user_id: user.id)
  end
end
