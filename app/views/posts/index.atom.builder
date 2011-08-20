atom_feed :language => 'en-US' do |feed|
  feed.title "CozBlog"
  feed.updated @posts.first.created_at

  @posts.each do |item|
    feed.entry(item) do |entry|
      entry.url post_url(item)
      entry.title item.title
      entry.content item.content, :type => 'html'
      # the strftime is needed to work with Google Reader.
      entry.updated(item.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
      entry.author 'cz.chen'
    end
  end
end

