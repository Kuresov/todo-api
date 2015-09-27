class Item < ActiveRecord::Base
  belongs_to :list
  delegate :user, to: :list
  before_create :default_values

  private

  def default_values
    self.completion = false if self.completion.nil?
  end
end
