xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Prior Versions of #{@poem.title} @ Chapbook"
    xml.description "Prior versions of the poem '#{@poem.title}' on Chapbook (http://poetry.heroku.com)."
    xml.link poem_url(p)
    
    @revisions.each do |r|
      xml.item do
        xml.title r.title
        xml.description simple_format(r.body)
        xml.pubDate r.created_at
        xml.link poem_url(p)
      end
    end
  end
end