class Essay < ActiveRecord::Base
  has_one :grade
  belongs_to :user
end
