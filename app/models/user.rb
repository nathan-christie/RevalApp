class User < ActiveRecord::Base


	has_and_belongs_to_many :followers, class_name: 'User', foreign_key: 'user_id', :join_table => :users_subscriptions, :dependant => :destroy
	has_and_belongs_to_many :following, class_name: 'User', foreign_key: 'follower_id', :join_table => :users_subscriptions, :dependant => :destroy

	def follow( user_id )
		if user_id != self.id
			Subscription.create(follower_id: self.id, user_id: user_id)
		end
	end

	def unfollow( user_id )
		if user_id != self.id
			sub = Subscription.find_by(follower_id: self.id, user_id: user_id)
			sub.delete
		end
	end
end
