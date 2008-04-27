xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Poems in the chapbook '#{@chapbook.title}'"
    xml.description "Introduction: #{@chapbook.introduction}."
    xml.link chapbook_url(@chapbook)
    
    @chapbook.pages.each do |p|
      xml.item do
        xml.title p.poem.title
        xml.description simple_format(p.poem.body)
        xml.pubDate p.created_at
        xml.link page_url(:chapbook_id => @chapbook, :sequence => p.sequence)
      end
    end
  end
end