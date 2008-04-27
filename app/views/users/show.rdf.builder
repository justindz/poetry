xml.instruct!
xml.rdf(:RDF,
  "xmlns:rdf"  => "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
  "xmlns:foaf" => "http://xmlns.com/foaf/0.1/",
  "xmlns:rdfs" =>"http://www.w3.org/2000/01/rdf-schema#") do

  xml.foaf(:Person) do
    xml.foaf(:name, @user.name)
    xml.foaf(:mbox_sha1sum, Digest::SHA1.hexdigest("mailto:" + @user.email))
    xml.foaf(:homepage, "rdf:resource" => user_url(@user))
    xml.foaf(:depiction, "rdf:resource" => "http://" + request.host_with_port + @user.avatar.public_filename()) unless @user.avatar.nil?

    @user.friends.each do |friend|
      xml.foaf(:knows) do
        xml.foaf(:Person) do
          xml.foaf(:name, friend.name)
          xml.rdfs(:seeAlso, "rdf:resource" => foaf_url(friend, :rdf))
        end
      end
    end
  end
end