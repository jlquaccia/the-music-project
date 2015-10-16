class PostController < ApplicationController
  def index
    @posts = Post.all
    @user = current_user
  end

  def show
  end
end