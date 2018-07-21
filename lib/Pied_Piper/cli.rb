class PiedPiper::Cli
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    puts "loading..."
    PiedPiper::Scraper.new("http://www.piedpiper.com/#team").scrape
    puts "#{self.name}"
    team_roaster
  end

  def team_roaster
    puts "Type to see a list of pipers"
    puts "Type exit to exit program"
    input = gets.strip
    if input.downcase == "list"
      list_pipers
    elsif input.downcase == "exit"
      puts "See ya! Happy Programming ✌️"
    else
      invalid
      team_roaster
    end
  end

  def list_pipers
    #iterate through an array of employees and list their name
    # 1.Richard
    # 2.Jared
    # 3.Monica
    puts "listing pipers"
  end

  def invalid
    puts "Incorrect Input. Please try again."
  end
end
#
# doc.css("div.section7 h2").text
# doc.css("div.row-wrapper p")[0].text
# doc.css("div.bio p")[1]
