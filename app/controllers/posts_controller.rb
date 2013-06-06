class PostsController < ApplicationController
  
   before_filter :require_login, :only => [:new, :destroy, :create, :edit, :update]
   before_filter :authorize_post, :except => [:index, :show, :new, :create]
   
  # GET /posts
  # GET /posts.json
  
  def index
    @posts = Post.text_search(params[:search]).paginate(:page =>params[:page], :per_page => 15).order('updated_at DESC')
###For solr indexing    
    #@search = Post.search do
    #  fulltext params[:search]
     # order_by :score, :desc
    #  order_by :updated_at, :desc
     # paginate :page => params[:page] || 1, :per_page => 15
   # end  
   # @posts = @search.results
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @post = Post.find(params[:id])
    @post.add_or_update_evaluation(:votes, value, current_user)
    #redirect_to :back, notice: "Thank you for voting"
    respond_to do |format|
      format.js
    end  
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post_id = @post.id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
      format.js
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
        format.js
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
end