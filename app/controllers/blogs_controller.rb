class BlogsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @blog = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
    redirect_to controller: 'users', action: 'show'
  end

  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
      redirect_to controller: 'users', action: 'show'
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end


