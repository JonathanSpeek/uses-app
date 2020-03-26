class Thing < ApplicationRecord
  validates :text, presence: true, length: { in: 4..40 }
end
