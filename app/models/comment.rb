class Comment < ActiveRecord::Base
  devise :validatable
  belongs_to :post
  belongs_to :user
end
