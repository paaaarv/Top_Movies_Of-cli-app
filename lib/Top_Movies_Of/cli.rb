
class TopMoviesOf::CLI

  def call
    puts "Hello, welcome to Top Movies Of!"
    puts "What year would you like to see the Top Movies Of?"
    @year = gets.strip.to_i
    #make scraper method in order to get Movie objects returned to this class
    start
  end

  def start(answer = nil)
    @answer = "y"
    @input = 4
    while @answer.downcase == "y"
      validate_input
        #need to validate to make sure there are enough movies - what to do if the year doesn't have 30 top movies?
      show_movies(@input)
      puts "Which movie would you like to see more information on?"
      @single_mov = gets.strip.to_i
      validate_single_mov
      #method to show movie
      show_single_movie(@single_mov)
    end
      puts "Would you like to see more ranked movies? Type 'Y' for yes, or any other letter for no."
      @answer = gets.strip.to_s
    end
  end

  def show_movies(input)
    if input == 1
      index = 0
    elsif input == 2
      index = 10
    else
      index = 20
    end
    TopMoviesOf::Scraper.new.make_movies(@year, input)

    #Movie method to find movies based on input
    TopMoviesOf::Movie.all[index..index+9].each do |movie|

      puts "#{movie.ranking}.#{movie.name}"
      puts "-----------------------------------"
    end
  end

  def show_single_movie(input)
    TopMoviesOf::Movie.find_movie(input)
  end


  def validate_input
    while @input > 3
      puts ""
      puts "What ranking movies would you like to see?"
      puts "1. 1-10"
      puts "2. 11-20"
      puts "3. 21-30"
      @input = gets.strip.to_i
      if @input > 3
        puts "Sorry, please enter 1,2, or 3 to see a list of top movies."
      end
  end

  def validate_single_mov
    if @input == 1
      while @single_mov <1 || @single_mov > 10
        puts "Sorry, please enter a number 1-10."
        puts "Which movie would you like to see more information on?"
        @single_mov = gets.strip.to_i
      end
    elsif @input == 2
      while @single_mov <11 || @single_mov > 20
        puts "Sorry, please enter a number 11-20."
        puts "Which movie would you like to see more information on?"
        @single_mov = gets.strip.to_i
      end
    else
      while @single_mov <21 || @single_mov > 30
        puts "Sorry, please enter a number 21-30."
        puts "Which movie would you like to see more information on?"
        @single_mov = gets.strip.to_i
      end
    end
  end
end
