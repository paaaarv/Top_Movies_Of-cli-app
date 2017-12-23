class TopMoviesOf::Scraper 

  def get_page(input)
    Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=#{input}"))
  end

  def get_single_movie_page(movie_name)
    split_name = movie_name.downcase.split
    url_name = split_name.join("_")
    
    Nokogiri::HTML(open("https://www.rottentomatoes.com/m/#{url_name}"))
  end

  def get_page_index(input)
    self.get_page(input).css(".table .unstyled article Link").text
  end 

  def make_movies(input) 
    get_page_index(input).each do |movie| 
      TopMoviesOf::Restaurant.new(name = movie) #Make a movie class to create new instances per movie
    end 
  end
end 
