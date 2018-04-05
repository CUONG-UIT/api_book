class Book < ApplicationRecord
  belongs_to :user
  validate :title,present: true
  validate :author,present: true
end
