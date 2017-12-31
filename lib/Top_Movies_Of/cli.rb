
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
        #need to validate to make sure there are enough movies - what to do if the year doesn't have 30 top movies?
      show_movies(@input)
      puts "Which movie would you like to see more information on?"
      @single_mov = gets.strip.to_i
      #method to show movie
      show_single_movie(@single_mov)
      puts "Would you like to see more ranked movies? Type 'Y' for yes, or any other letter for no."
      @answer = gets.strip.to_s
    end
    end
  end

  def show_movies(input)
    @new_scraper = TopMoviesOf::Scraper.new
    @new_scraper.make_movies(@year)

    #Movie method to find movies based on input
    TopMoviesOf::Movie.all.each do |movie|
      puts ""
      puts "#{movie.ranking}.#{movie.name}"
      puts "-----------------------------------"
    end
  end

  def show_single_movie(input)
    movie = @new_scraper.add_attributes(input)
    puts ""
    puts "Movie you selected: #{movie.name}"
    puts "Score: #{movie.score}"
    puts "Summary: #{movie.summary}"
    puts "-------------------------"
  end

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
