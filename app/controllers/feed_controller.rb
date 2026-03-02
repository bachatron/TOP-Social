class FeedController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.feed_posts
  end
end
