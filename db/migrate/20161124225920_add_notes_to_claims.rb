class AddNotesToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :note, :text
  end
end
