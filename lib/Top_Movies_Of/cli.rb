
class TopMoviesOf::CLI

  def call
    puts "Hello, welcome to Top Movies Of!"
    puts "What year would you like to see the Top Movies Of?"
    @year = gets.strip.to_i
    #make scraper method in order to get Movie objects returned to this class
    start
  end

  def start
    answer = "y"
    input = 4
    while answer.downcase == "y"
      while input > 3
        puts ""
        puts "What ranking movies would you like to see?"
        puts "1. 1-10"
        puts "2. 11-20"
        puts "3. 21-30"
        input = gets.strip.to_i
        if input > 3
          puts "Sorry, please enter 1,2, or 3 to see a list of top movies."
        end
      end
      puts "Which movie would you like to see more information on?"
      single_mov = gets.strip.to_i
      if input == 1
        while single_mov <1 || single_mov > 10
          puts "Sorry, please enter a number 1-10."
          puts "Which movie would you like to see more information on?"
          single_mov = gets.strip.to_i
        end
      #add method to see the single movie information
    elsif input == 2
      while single_mov <11 || single_mov > 20
        puts "Sorry, please enter a number 11-20."
        puts "Which movie would you like to see more information on?"
        single_mov = gets.strip.to_i
      end
      #method to show movie
    else
      while single_mov <21 || single_mov > 30
        puts "Sorry, please enter a number 21-30."
        puts "Which movie would you like to see more information on?"
        single_mov = gets.strip.to_i
      end
      #method to show movie
    end
      show_movies(input)
      puts "Would you like to see more ranked movies? Type 'Y' for yes, or any other letter for no."
      answer = gets.strip.to_s
    end
  end

  def show_movies(input)
    TopMoviesOf::Scraper.new.make_movies(@year)
    #Movie method to find movies based on input
    TopMoviesOf::Movie.find_movie(input)

  end

end
