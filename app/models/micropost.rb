class Micropost < ActiveRecord::Base
  
  belongs_to :user

  attr_accessible :content, :user_id
  
  validates :user_id, presence: true  
  validates :content, presence: true, length: { maximum: 140 }

end
