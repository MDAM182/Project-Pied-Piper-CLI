class PiedPiper::Scraper
  attr_accessor :team_page

  def initialize(url)
    self.team_page = url
  end

  def scrape_teampage
    doc = Nokogiri::HTML(open(self.team_page))
    array =[]
    doc.css("div.photo.who-we-are-info p")[0..5].each do |p|
    piper_hash = {}
    piper_hash[:name] = doc.css("div.row-wrapper p").text
    piper_hash[:photo_url] = doc.css("div.img-photo img").attr("src")
    array.push(piper_hash)
    end
    PiedPiper::Piper.create_from_collection(array)
    binding.pry
  end

  def scrape
    scrape_teampage
  end

end

#doc.css("div.row-wrapper p")[0...6].each.methods
# doc.css("div.section7 h2").text
# doc.css("div.section7 p i")[0].text.split

# doc.css("div.row-wrapper  i" )[0].text
# doc.css("div.bio p")[1]
# doc.css("div.row-wrapper p")[0].children.first.text
# PiedPiper::Piper.all
#doc.css("div.photo.who-we-are-info p")[0..5].text
