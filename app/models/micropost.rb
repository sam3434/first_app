class Micropost < ActiveRecord::Base
attr_accessible :content
belongs_to :user
default_scope :order => 'microposts.created_at DESC'
validates :content, :presence=>true,:length=>{:maximum=>140}
#validates :user_id, presence=>true

def self.from_users_followed_by(user)
following_ids=user.following_ids
where("user_id in #{following_ids} OR user_id==?",user)
end

end
