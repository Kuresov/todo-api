class Item < ActiveRecord::Base
  belongs_to :list, dependent: :destroy
end
