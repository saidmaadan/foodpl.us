class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :gender, :string
    add_column :users, :headline, :string
    add_column :users, :about, :text
    add_column :users, :social, :string
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_column :users, :favorite_website, :string
    add_column :users, :image, :string
  end
end
