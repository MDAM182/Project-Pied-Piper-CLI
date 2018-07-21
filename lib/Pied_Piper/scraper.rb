class PiedPiper::Scraper
  attr_accessor :team_page

  def initialize(url)
    self.team_page = url
  end

  def scrape_teampage
    doc = Nokogiri::HTML(open(self.team_page))
    binding.pry
  end

  def scrape
    scrape_teampage
  end

end
