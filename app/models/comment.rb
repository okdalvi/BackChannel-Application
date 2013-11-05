class Comment < ActiveRecord::Base
  attr_accessible :comment,:post_id, :user_id

  validates :comment, :presence=>true
  validates :post_id, :presence=>true
  #validates :user_id, :presence=>true

  #validates :comment, :presence=>true

  belongs_to :post
  belongs_to :user

  has_many :comment_votes, :dependent => :destroy

end
