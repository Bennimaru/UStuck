class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  acts_as_punchable

  validates :title, presence: true
  validates :content, presence: true
end
