
class TopMoviesOf::CLI 

  def call 
    puts "Hello, welcome to Top Movies Of!"
    puts "What year would you like to see the Top Movies Of?"
    year = gets.strip.to_i 
    TopMoviesOf::Scraper.#make scraper method in order to get Movie objects returned to this class
    start
  end 

  def start 
    answer = "y"
    while answer.downcase == "y"
      puts ""
      puts "What ranking movies would you like to see?"
      puts "1. 1-10"
      puts "2. 11-20"
      puts "3. 21-30"
      input = gets.strip.to_i 
      show_movies(input)


      puts "Which movie would you like to see more information on?"
      input = gets.strip.to_i

      puts "Would you like to see more ranked movies? Type 'Y' for yes, or any other letter for no."
      answer = gets.strip.to_s
    end  
  end


end 