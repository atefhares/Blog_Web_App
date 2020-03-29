class Post < ApplicationRecord
  validates :title, :content, presence: true
  validates :title, uniqueness: true
  validates_length_of :title, minimum: 3, maximum: 50, allow_blank: false
  belongs_to :user
  has_many :comments
end
