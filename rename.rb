Dir.entries("blog")[2..-1].each do |directory|
  begin
  File.rename("blog/#{directory}/index.html", "blog/#{directory}.html")
  rescue Exception => e
    p e
  end
end
