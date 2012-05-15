atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated
              
  @comics.each do |comic|
    next if comic.updated_at.blank?

    feed.entry comic, published: comic.published_at do |entry|
      entry.url comic_url(comic)
      entry.title comic.title
      entry.content feed_content(comic), type: :html
      entry.updated comic.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")

      entry.author do |author|
        author.name "John Pray"
      end
    end
  end
end