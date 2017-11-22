class Comment < ActiveRecord::Base
  belongs_to :blogpost
  belongs_to :user
  validates :content, presence: true, uniqueness: true
end
