atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated
              
  @comics.each do |comic|
    next if comic.updated_at.blank?

    feed.entry comic, published: comic.created_at do |entry|
      entry.title comic.title
      entry.content feed_content(comic), type: :html

      entry.author do |author|
        author.name "John P. Pray"
      end
    end
  end
end