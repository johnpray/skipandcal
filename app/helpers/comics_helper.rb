module ComicsHelper
	def category_links_list(comic = @comic)
		if comic && comic.categories
			comic.categories.order('name ASC').collect {|category| link_to(category.name, category_path(category)) }.join(", ").html_safe
		end
	end

	def next_path(comic = @comic, category = nil)
		comic_path(comic.next(category), category: category ? category.slug : nil)
	end

	def previous_path(comic = @comic, category = nil)
		comic_path(comic.previous(category), category: category ? category.slug : nil)
	end

	def feed_content(comic)
    content = ''
    if comic.frames.count > 1
	    comic.frames.each do |f|
	      content += "<p><img style='max-width: 100%' src='#{f.image.url(:medium)}' alt='#{f.alt_text}' title='#{f.title_text}' /></p>"
	    end
	  elsif comic.frames.count > 0
	  	content += "<p><img style='max-width: 100%' src='#{comic.frames.first.image.url(:large)}' alt='#{comic.frames.first.alt_text}' title='#{comic.frames.first.title_text}' /></p>"
	  end
    content += "<div>#{markdown comic.description}</div>"
  end
end