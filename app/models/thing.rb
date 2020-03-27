class Thing < ApplicationRecord
  belongs_to :user
  has_many :upvotes

  validates :text, presence: true, length: { in: 4..40 }
  validates_presence_of :user_id
end
