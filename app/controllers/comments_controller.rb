class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
   # @comment = Comment.new(params[:comment])

    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@post)
=begin


    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PUT /comments/1
  # PUT /comments/1.json


  def add_c_vote

    @comment = Comment.find(params[:id])
    @owner= @comment.user_id

=begin    if(@comment.user_id==current_user.id)
      #flash[:notice] = "You cannot vote for your own comment"
      flash[:notice] = 'You cannot vote for your own comment'


    elsif (CommentVote.count_by_sql("select count(*) from comment_votes where user_id=#{current_user.id} and comment_id = #{@comment.id}") == 1 )
      #flash[:notice] = "You have already voted for this comment"
      flash[:notice] = 'You have already voted for this comment'

      end
=end

    if(@owner!=current_user.id)
      if CommentVote.count_by_sql("select * from comment_votes where user_id=#{current_user.id} and comment_id=#{params[:id]}")==0
        @comment_vote=CommentVote.new
        @comment_vote.user_id=current_user.id
        @comment_vote.comment_id=params[:id]
        @comment_vote.save

        #redirect_to(:controller=>'posts', :action=> 'index')
        #redirect_to post_path(@post.id=@comment.post_id)

        redirect_to :back



      else
        #redirect_to(:controller=>'posts', :action=> 'index')
        #redirect_to post_path(@post.id=@comment.post_id)

        redirect_to :back


    end
    else
      #redirect_to(:controller=>'posts', :action=> 'index')
      #redirect_to post_path(@post.id=@comment.post_id)
      redirect_to :back

    end

  end



  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      #format.html { redirect_to comments_url }
      format.html {redirect_to :back  }
      format.json { head :no_content }
    end
  end
end
