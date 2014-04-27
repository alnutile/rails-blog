class Post < ActiveRecord::Base
  attr_accessible :body, :name, :title, :tag_list, :created_at, :rendered_body
  acts_as_taggable
  before_save :render_body

  private
  def render_body
    require 'redcarpet'
    # renderer = Redcarpet::Render::HTML.new
    renderer = PygmentizeHTML
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    self.rendered_body = redcarpet.render self.body
  end
end

class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end
