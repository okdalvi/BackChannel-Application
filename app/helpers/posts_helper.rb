module PostsHelper
  def can_vote?(post_id)
    @votes = PostVote.all(:conditions => {:post_id => post_id})
    @votes.each do |v|
      if v.user_id == session[:user_id]
        return false
      end
    end
    return true
  end

  def num_votes(post_id)
    @votes = PostVote.all(:conditions => {:post_id => post_id})
    @votes.count
  end

  def get_votes(post_id)
    @votes = PostVote.all(:conditions => {:post_id => post_id})
  end

  def has_voted?(post_id)
    if PostVote.all(:conditions => {:post_id => post_id, :user_id => current_user})
      return true
    else
      return false
    end
  end
end
