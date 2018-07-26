class PiedPiper::Cli
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    puts "loading..."
    puts ""
    puts "Welcome to Pied Piper!"
    PiedPiper::Scraper.new("http://www.piedpiper.com/#team").scrape
    puts "#{self.name}"
    start
  end

  def start
     puts ""
     puts "Type SV to meet some pipers or"
     puts ""

    puts "Type EXIT to exit program"
    puts ""
    input = gets.strip
    if input.upcase == "SV"
      list_pipers
    elsif input.upcase == "EXIT"
      puts "See ya! Happy Programming ✌️"
    else
      invalid
      start
    end
  end

  def list_pipers
    puts ""
    PiedPiper::Piper.all.each_with_index do |piper,index|
    puts "#{index + 1}.#{piper.name}"
  end

    puts ""
    puts "Which piper would you like to know more about? Enter a number 1-6 or type EXIT to leave 🙃"
    input = gets.strip.to_i

     if input.to_i > 0
       print_info(input)

    elsif input.upcase == "EXIT"
      puts "Live Long and Prosper 🖖"

    else
      invalid
      list_pipers
    end

    puts "Would you like to meet another piper?  Enter a number Y type EXIT to leave 🙃"
    input = gets.strip

    if input.upcase == "Y"
      list_pipers
    elsif input.upcase == "EXIT"
      puts ""
      puts "See ya! Happy Programming ✌️"
    else


    end
end

  def print_info(input)
    piper = PiedPiper::Piper.all[input - 1]

    puts "---------- #{piper.name} ----------"
    #return the input of the number the user entered
    puts ""
    puts "---------- #{piper.postion} ----------"

    puts ""
    # puts "#{piper.bio}"
    puts ""

    puts "Click link to view photo #{piper.photo}"
    puts ""
   end


  def invalid
    puts ""
    puts "Incorrect Input. Please try again."
    puts ""
  end
end
