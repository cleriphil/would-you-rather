class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates_presence_of :author
  validates_presence_of :comment
end
