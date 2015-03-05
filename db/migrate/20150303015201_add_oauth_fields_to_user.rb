class AddOauthFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :clients, :provider, :string
  	add_column :clients, :uid, :integer
  	add_column :clients, :token, :string
  	add_column :clients, :secret, :string
  	add_column :clients, :url_photo, :string
  end
end
