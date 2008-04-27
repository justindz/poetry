xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Chapbook Poems by #{@user.name}"
    xml.description "Recent poems published on Chapbook (http://poetry.heroku.com) by #{@user.name}."
    xml.link user_url(@user)
    
    @poems.each do |p|
      xml.item do
        xml.title p.title
        xml.description simple_format(p.body)
        xml.pubDate p.created_at
        xml.link poem_url(p)
      end
    end
  end
end