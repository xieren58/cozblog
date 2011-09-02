class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :destroy]
  #caches_action :index
  include_kindeditor :only => [:new, :edit]
  
  # GET /posts
  def index
    @posts = Post.page(params[:page])
    @tags = tag_cloud
    
    respond_to do |format|
      format.html # index.html.erb
      format.atom { render :layout => false }
      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom),
                               :status => :moved_permanently }
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @prev_post = Post.find_by_id(params[:id].to_i - 1)
    @next_post = Post.find_by_id(params[:id].to_i + 1)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to(@post, :notice => 'Post was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
       redirect_to(@post, :notice => 'Post was successfully updated.')
    else
       render :action => "edit"
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_url)
  end
  
  def tag
    @tag = params[:tag]
    @posts = Post.tagged_with(params[:tag]).page(params[:page])
    @tags = tag_cloud
  end
  
  def about
    @tags = tag_cloud
  end
  
  
  private
  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
  
end
