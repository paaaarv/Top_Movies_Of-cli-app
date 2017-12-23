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

  def get_single_movie(movie_name)
    page = get_single_movie_page(movie_name)
    @score = page.css("#mainColumn #scorePanel .tomato-left .meter-value superPageFontColor").text.to_i 
    @summary = page.css("#mainColumn .media-body #movieSynopsis").text 
    #check out how to get Directed By, Genre, and Actors columns 
  end 

  def make_movies(input_name) 
    get_page_index(input).each do |movie| 
      get_single_movie(input_name)
      TopMoviesOf::Movie.new(name = movie, score = @score, summary = @summary) #Make a movie class to create new instances per movie
    end 
  end
end 
