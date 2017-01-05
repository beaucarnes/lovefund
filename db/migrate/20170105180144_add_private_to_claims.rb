class AddPrivateToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :private, :boolean
  end
end
