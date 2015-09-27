class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  enum permissions: {hidden: 0, viewable: 1, open: 2}

  validates :permissions, inclusion: { in: ["hidden", "viewable", "open"]}
end
