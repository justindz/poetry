xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Recent Poems @ Chapbook"
    xml.description "Recent poems published on Chapbook (http://poetry.heroku.com)."
    xml.link poems_url
    
    @poems.each do |p|
      xml.item do
        xml.title p.title
        xml.description (p.body)
        xml.pubDate p.created_at
        xml.link poem_url(p)
      end
    end
  end
end