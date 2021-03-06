class PiedPiper::Scraper
  attr_accessor :team_page

  def initialize(url)
    self.team_page = url
  end

  def scrape_teampage
    doc = Nokogiri::HTML(open(self.team_page))

    array =[]

  doc.css("div.photo.who-we-are-info")[0..5].each do |div|
    piper_hash = {}


    piper_hash[:name] = div.css("p").children.first.text
    piper_hash[:postion] = div.css("i").children.text
    piper_hash[:photo] =  div.css("img").attr("src").text
    array.push(piper_hash)

    end
    PiedPiper::Piper.create_from_collection(array)
    end

  def scrape
    scrape_teampage
  end

end
