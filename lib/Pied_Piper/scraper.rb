class PiedPiper::Scraper
  attr_accessor :team_page

  def initialize(url)
    self.team_page = url
  end

  def scrape_teampage
    doc = Nokogiri::HTML(open(self.team_page))

    array =[]
    # doc.css('br').each do |br|
    # br.replace()
    # end
    doc.css("div.section7 div.row-wrapper p")[0..5].each do |p|
    piper_hash = {}

    piper_hash[:name] = doc.css("div.row-wrapper p")[0].children.first.text
    piper_hash[:postion] = doc.css("div.row-wrapper p i" )[0].text
    array.push(piper_hash)
    binding.pry
    end
    PiedPiper::Piper.create_from_collection(array)


    end

  # def scrape_bios
  #   PiedPiper::Piper.all.each do |piper|
  #   doc = Nokogiri::HTML(open(piper.url))
  #
  #
  # #   end
  # end

  def scrape
    scrape_teampage
    # scrape_bios
  end

end



# doc.css("div.row-wrapper p")[0].children.first.text
# PiedPiper::Piper.all

# doc.css("div.img-photo img").attr("src")
