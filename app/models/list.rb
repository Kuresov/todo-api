class List < ActiveRecord::Base
  enum permissions: [:hidden, :viewable, :open]
  belongs_to :user
  has_many :items
end
