class Subscription < ActiveRecord::Base
	self.table_name = "users_subscriptions"
	belongs_to :follower, :class_name => 'User'
	belongs_to :user
end
