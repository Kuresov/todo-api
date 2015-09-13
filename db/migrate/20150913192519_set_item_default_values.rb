class SetItemDefaultValues < ActiveRecord::Migration
  def change
    change_column :items, :completion, :boolean, default: false
  end
end
