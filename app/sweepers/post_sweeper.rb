class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def sweep(post)
    expire_page posts_path
    expire_page posts_path(post)
    expire_page "/posts"
    FileUtils.rm_rf "#{page_cache_directory}/posts.html"
    FileUtils.rm_rf "#{page_cache_directory}/posts"
  end
  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end