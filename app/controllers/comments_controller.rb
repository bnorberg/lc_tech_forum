class CommentsController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit]
  before_filter :authorize_comment, :except => [:index, :show, :new, :create]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @comment = Comment.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    #redirect_to :back, notice: "Thank you for voting"
    respond_to do |format|
      format.js 
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
      format.js
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
      post_id = params[:comment].delete(:post_id)

      @comment = Comment.new(params[:comment])
      @comment.post_id = post_id

      @comment.save

      redirect_to post_path(@comment.post)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to post_path(@comment.post_id), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@comment.post_id) }
      format.json { head :no_content }
    end
  end
end
