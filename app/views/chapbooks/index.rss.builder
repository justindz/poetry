xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Recent Chapbooks"
    xml.description "Recent chapbooks published on Chapbook (http://poetry.heroku.com).  A chapbook is a collection of poems."
    xml.link chapbooks_url
    
    @chapbooks.each do |c|
      xml.item do
        xml.title c.title
        xml.description simple_format(c.introduction)
        xml.pubDate c.created_at
        xml.link chapbook_url(c)
      end
    end
  end
end