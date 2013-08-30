class ContentSweeper < ActionController::Caching::Sweeper
  observe Content

  def sweep(content)
    expire_page home_path
    expire_page about_path
    expire_page "/"
    expire_page "/about"
    FileUtils.rm_rf "#{page_cache_directory}/about.html"
    FileUtils.rm_rf "#{page_cache_directory}/index.html"
  end
  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end