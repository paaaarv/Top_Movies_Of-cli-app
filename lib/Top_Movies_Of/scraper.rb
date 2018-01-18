
class TopMoviesOf::Scraper

  def initialize
  end

  def get_page(year)
    @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=#{year}"))
  end

  def get_movie_title #gets an array of top movie titles
    get_title = get_page(@year).css("td .articleLink")
    array = []
    get_title.each do |title|
      array << title.text.lstrip
    end
    return array
  end

  def get_single_movie_page(name) #scrape specific movie page
    if url=get_page(@year).search('td').text_includes("#{name}").first
      attributes = url.search("a")
      url_name = attributes.first.values.first
      Nokogiri::HTML(open("https://www.rottentomatoes.com#{url_name}"))
    end
  end

  def get_movie_score(name)
    if get_single_movie_page(name) != nil
      page = get_single_movie_page(name)
      @score = page.css("#all-critics-numbers .superPageFontColor").first.text
      return @score
    else
      puts "#{name} #{page}"
      puts "Sorry, I cannot pull up information about this movie"
      return nil
    end
  end

  def get_movie_summary(name)
    if get_single_movie_page(name) != nil
      page = get_single_movie_page(name)
      @summary = page.css("#movieSynopsis").text.lstrip
      return @summary
    else
      puts "#{name} #{page}"
      puts "Sorry, I cannot pull up information about this movie"
      return nil
    end
  end

  def make_movies(year) #makes movie objects from array of movie titles
    @year = year
    x = 1
    while x <= get_movie_title.length
      get_movie_title.each do |movie|
        format_movie = movie.split(" (")
        new_mov = TopMoviesOf::Movie.new(ranking = x,name = format_movie[0])
        x+=1
      end
    end
  end

  def add_attributes(input) #adds score and summary for a single movie that is chosen
    movie = TopMoviesOf::Movie.find_movie(input)
    summary = get_movie_summary(movie.name)
    score = get_movie_score(movie.name)
    movie.summary = summary
    movie.score = score
    return movie
  end

end
