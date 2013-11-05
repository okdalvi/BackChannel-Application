class Post < ActiveRecord::Base
  attr_accessible :comments_count, :content, :name, :tag, :category_id, :user_id

  validates :content, :presence=>true
  validates :name, :presence=>true
  validates :tag, :presence=>true
  #validates :comments_count, :presence=>true
  #validates :category, :presence=>true
  validates :category_id, :presence=>true
  #validates :user_id, :presence=>true

  has_many :comments , :dependent => :destroy
  has_many :post_votes , :dependent => :destroy

  belongs_to :category
  belongs_to :user
  #has_many :comments, :dependent => :destroy
  #has_many :votes, :dependent => :destroy

  def self.find_by_content(content)
    #Post.all(:conditions => ["message like ?", "%#{content}%"])
    Post.where("content LIKE ?", "%#{content}%" )
  end

  def self.find_by_user_id(user_id)
    Post.all(:conditions => {:user_id => user_id})
  end

  def self.find_by_category_id(category_id)
    Post.all(:conditions => {:category_id => category_id})
  end

end
