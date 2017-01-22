class AddCategoryboolsToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :wants_rp, :boolean
    add_column :subscriptions, :wants_rh, :boolean
    add_column :subscriptions, :wants_op, :boolean
    add_column :subscriptions, :wants_oh, :boolean
  end
end
