require 'open-uri'

class PostsController < ApplicationController

  def index

    #Post.parse
    @posts = Post.all
  end

  def create
  end

end
