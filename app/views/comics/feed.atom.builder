atom_feed :language => 'en-US' do |feed|
  feed.title "Skip & Cal ~ cartoons and comics by John P. Pray"
  feed.updated @comics.reorder('created_at DESC').first.created_at
              
  @comics.each do |comic|
    feed.entry comic, :published => comic.published_at do |entry|
      entry.title comic.title
      entry.summary comic.summary + '<br /><br />Read the comic: <a href="' + comic_url(comic) + '">' + comic_url(comic) + '</a><br /><br />', :type => 'html'
      entry.content feed_content(comic), type: :html

      entry.author do |author|
        author.name "John P. Pray"
      end
    end
  end
end