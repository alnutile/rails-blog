module ApplicationHelper

	def tagMethod 
		def self.tagged_with(name)
		  Tag.find_by_name!(name).posts
		end

		def self.tag_counts
		  Tag.select("tags.*, count(taggings.tag_id) as count").
		    joins(:taggings).group("taggings.tag_id")
		end

		def tag_list_json
		  tags
		end

		def tag_list
		  tags.map(&:name).join(", ")
		end

		def tag_list=(names)
		  self.tags = names.split(",").map do |n|
		    Tag.where(name: n.strip).first_or_create!
		  end
		end
  end

  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

end
