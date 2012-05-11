module ComicsHelper
	def category_links_list(comic = @comic)
		if comic && comic.categories
			comic.categories.order('name ASC').collect {|category| link_to(category.name, category_path(category)) }.join(", ").html_safe
		end
	end
end