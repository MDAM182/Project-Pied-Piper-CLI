class PiedPiper::Cli
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    puts "loading..."
    PiedPiper::Scraper.new("http://www.piedpiper.com/").scrape
    puts "#{self.name}"
    team_roaster
  end

  def team_roaster
    puts "Type sv to see a list of pipers"
    puts "Type exit to exit program"
    input = gets.strip
    if input.downcase == "sv"
      list_pipers
    elsif input.downcase == "exit"
      puts "See ya! Happy Programming ✌️"
    else
      invalid
      team_roaster
    end
  end

  def list_pipers
    PiedPiper::Piper.all.each_with_index do |piper,index|
    puts "#{index + 1}.#{piper.name}"
    #iterate through an array of employees and list their name
    # 1.Richard
    # 2.Jared
    # 3.Monica
   end
    # puts "listing pipers"
  end

  def invalid
    puts "Incorrect Input. Please try again."
  end
end
#
