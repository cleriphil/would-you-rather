class Question < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :description_a
  # validates :description_a, length: { maximum: 30 }
  validates_presence_of :description_b
  # validates :description_b, length: { maximum: 30 }
  has_attached_file :image_a, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_b, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image_a
  validates_attachment_presence :image_b
  validates_attachment_content_type :image_a, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image_b, :content_type => /\Aimage\/.*\Z/
end
