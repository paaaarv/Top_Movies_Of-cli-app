
class TopMoviesOf::CLI 

  def call 
    puts "Hello, welcome to Top Movies Of!"
    start
  end 

  def start 
    puts ""
    puts "What ranking movies would you like to see?"
    puts "1. 1-10"
    puts "2. 11-20"
    puts "3. 21-30"
    input = gets.strip.to_i 
    show_movies(input)
  end
  


end 