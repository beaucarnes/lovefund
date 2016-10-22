class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title 
      t.string :name
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :zip
      t.text :description
      t.text :description_met
      t.string :picture
      t.boolean :facilitated_by_church
      t.boolean :anon_email
      t.integer :status, default: 0
      t.integer :category
      t.integer :flagged, default: 0
      t.boolean :show_phone
      t.string :email_key
      t.string :activation_digest

      t.timestamps null: false
    end
  end
end
