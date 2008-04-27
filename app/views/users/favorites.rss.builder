xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Favorite Poems of #{@user.name} on Chapbook"
    xml.description "Favorite poems of #{@user.name} on Chapbook (http://poetry.heroku.com)."
    xml.link favorites_url(@user)
    
    @favorites.each do |f|
      xml.item do
        xml.title f.poem.title
        xml.description simple_format(f.poem.body)
        xml.pubDate f.poem.created_at
        xml.link poem_url(f.poem)
      end
    end
  end
end