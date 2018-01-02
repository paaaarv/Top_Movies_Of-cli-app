
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
    while @answer.downcase == "y"
        #need to validate to make sure there are enough movies - what to do if the year doesn't have 30 top movies?
      show_movies
      puts "Which movie would you like to see more information on?"
      @single_mov = gets.strip.to_i
      #method to show movie
      show_single_movie(@single_mov)
      puts "Would you like to see more ranked movies? Type 'Y' for yes, or any other letter for no."
      @answer = gets.strip.to_s
    end
  end

  def show_movies
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
    puts ""
    puts "Score: #{movie.score}"
    puts ""
    puts "Summary: #{movie.summary}"
    puts ""
    puts "-------------------------"
  end
end
