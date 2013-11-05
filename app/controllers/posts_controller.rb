class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    @post.user_id = current_user.id
    #@post = @user.posts.create(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def add_vote
    @post = Post.find(params[:id])
    @owner= @post.user_id

    if(@post.user_id==current_user.id)
      flash[:notice] = "You cannot vote for your own post"

    elsif (PostVote.count_by_sql("select count(*) from post_votes where user_id=#{current_user.id} and post_id = #{@post.id}") == 1 )
      flash[:notice] = "You have already voted for this post"

    end



    if(@owner!=current_user.id)
      if PostVote.count_by_sql("select * from post_votes where user_id=#{current_user.id} and post_id=#{params[:id]}")==0
        @post_vote=PostVote.new
        @post_vote.user_id=current_user.id
        @post_vote.post_id=params[:id]
        @post_vote.save
        redirect_to(:controller=>'posts', :action=> 'index')
      else
        redirect_to(:controller=>'posts', :action=> 'index')
      end
    else
      redirect_to(:controller=>'posts', :action=> 'index')
    end

  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def search
    @search = params[:search]
    if @search == ""
      flash[:notice] = "Search terms cannot be blank!"
      redirect_to root_path
    else

      @results = Post.find_by_content(@search)

      @posts = Post.where("name LIKE ?", "%#{params[:search]}%")
      @posts.each do |p|
          @results << p
      end

      @posts = Post.where("tag LIKE ?", "%#{params[:search]}%")
      @posts.each do |p|
        @results << p
      end

      @user = User.where("name LIKE ?", "%#{params[:search]}%")
      @user.each do |u|
        @post_user = Post.find_by_user_id(u.id)
        @post_user.each do |p|
          @results << p
        end
      end
      @cats = Category.where("title LIKE ?", "%#{params[:search]}%")
      @cats.each do |c|
        @post_cat = Post.find_by_category_id(c.id)
        @post_cat.each do |p|
          @results << p
        end
      end

      @results = @results.sort.uniq

    end
  end
end
