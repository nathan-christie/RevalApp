class UserSubscriptions < ActiveRecord::Migration
  def change
  	create_table :users_subscriptions do |t|
  		t.references :follower
  		t.references :user
  		t.index [:follower_id, :user_id], unique: true
  	end
  end
end
