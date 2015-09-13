class AddCompleteToItems < ActiveRecord::Migration
  def change
    add_column :items, :completion, :boolean
  end
end
