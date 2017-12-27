require 'nokogiri'
require 'open-uri'
require 'pry'
require 'nikkou'

class TopMoviesOf::Scraper

  def initialize
  end

  def get_page(year)
    @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=#{year}"))
  end

  def get_movie_title #gets an array of top movie titles
    get_title = get_page(@year).css("td .articleLink")
    array = []
    x = 0
    while x <= 29 || x < get_title.length
      array << get_title[x].text.lstrip
      x+=1
    end
    return array
  end

  def get_single_movie_page(name)
    if url=get_page(@year).search('a').text_includes("#{name}").first
      url_name = url.attributes["href"].value
      Nokogiri::HTML(open("https://www.rottentomatoes.com#{url_name}"))
    end
  end

  def get_single_movie(name)
    if get_single_movie_page(name) != nil
      page = get_single_movie_page(name)
      @score = page.css("#all-critics-numbers .superPageFontColor").first.text
      @summary = page.css("#movieSynopsis").text.lstrip
    else
      puts "#{name} #{page}"
      puts "Sorry, I cannot pull up information about this movie"
      return nil
    end
    #check out how to get Directed By, Genre, and Actors columns
  end

  def make_movies(year) #makes movie objects from array of movie titles
    @year = year
    x = 1
    get_movie_title(@year).each do |movie|
      format_movie = movie.split(" (")
      new_mov = TopMoviesOf::Movie.new(ranking = x,name = format_movie[0])

      x+=1
    end
  end

end
