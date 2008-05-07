xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Poems Matching '#{@terms}' @ Chapbook"
    xml.description "Recent poems containing '#{@terms}' on Chapbook (http://poetry.heroku.com)."
    xml.link search_url(@terms)
    
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