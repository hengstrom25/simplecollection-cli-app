class Scraper
  
  def scrape_page
    doc = Nokogiri::HTML(open("http://tincanknits.com/thesimplecollection.html"))
    page = doc.css("tr td a img.img-thumbnail-tight")
    patterns = page.map {|img|
      Pattern.new(img.attr("alt"), img.parent.attr("href"))}
    patterns = patterns.uniq {|patt| patt.name}
    patterns.select {|patt|
      patt.name != "Handmade in the UK" && patt.name != "Knitting Basics PDF" && patt.name != "Grain by Tin Can Knits"}
    #puts doc.css("tr p:first-child span.pattnavtext")
  end
  
  def scrape_pattern(pattern)
    doc = Nokogiri::HTML(open("http://tincanknits.com/#{pattern.url}"))
    pattern.size = doc.css("div.LHbox table")[1].css("tr")[0].css("td")[1].text
    pattern.materials = doc.css("div.LHbox table")[1].css("tr")[1].css("td")[1].text
    pattern.gauge = doc.css("div.LHbox table")[1].css("tr")[2].css("td")[1].text
    pattern.suggested_needles = doc.css("div.LHbox table")[1].css("tr")[3].css("td")[1].text
    pattern.notes = doc.css("div.LHbox table")[1].css("tr")[4].css("td")[1].text
    pattern.description = doc.css("div.LHbox blockquote p").text
  end


end
