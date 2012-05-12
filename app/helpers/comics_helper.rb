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
end