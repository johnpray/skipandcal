module ComicsHelper
	def category_links_list(comic = @comic)
		if comic && comic.categories
			comic.categories.order('name ASC').collect {|category| link_to(category.name, category_path(category)) }.join(", ").html_safe
		end
	end

	def next_path(comic = @comic, options = {})
		opt = {category: nil}.merge(options)
		comic_path(comic.next(opt[:category]), opt)
	end

	def previous_path(comic = @comic, options = {})
		opt = {category: nil}.merge(options)
		comic_path(comic.previous(opt[:category]), opt)
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
	  content += "<p><i>#{display_dates(comic)}</i></p>"
    content += "<div>#{markdown comic.description}</div>"
    if comic.categories.include?(Category.find('cardinal-courier'))
			content += '<p><i>This work originally appeared in the </i><a href="http://www.cardinalcourieronline.com">Cardinal Courier</a><i>, the award-winning student-run newspaper at <a href="http://www.sjfc.edu">St. John Fisher College</a>, between 2007 and 2011.</i></p>'
		end
		content
  end

  def display_dates(comic)
  	if comic.published_at.to_date != comic.created_at.to_date
  		"#{comic.published_at.to_date.to_formatted_s(:long)} (published) / #{comic.created_at.to_date.to_formatted_s(:long)} (posted here)"
  	else
  		"#{comic.created_at.to_date.to_formatted_s(:long)}"
  	end
  end

  def display_short_dates(comic)
  	Date::DATE_FORMATS[:short_with_year] = "%e %b %Y"

  	if comic.published_at.to_date != comic.created_at.to_date
  		"#{comic.published_at.to_date.to_formatted_s(:short_with_year)}"
  	else
  		"#{comic.created_at.to_date.to_formatted_s(:short_with_year)}"
  	end
  end
end