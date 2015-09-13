class List < ActiveRecord::Base
  enum permissions: {hidden: 0, viewable: 1, open: 2}
  belongs_to :user, dependent: :destroy
  has_many :items

  validates :permissions, inclusion: { in: ["hidden", "viewable", "open"] }
end
