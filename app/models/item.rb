class Item < ApplicationRecord
  belongs_to :todo

  validates_presence_of :name

  scope :by_done, ->(value){where(done:value)}
end
