class Essay < ActiveRecord::Base
  has_one :grade
  belongs_to :user
  
  scope :is_graded, -> { where(gradded: true) }
  scope :is_not_graded, -> { where(gradded: !true) }
  
end
