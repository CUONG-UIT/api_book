class Book < ApplicationRecord
  belongs_to :user
  validates :title,present: true
  validates :author,present: true
end
