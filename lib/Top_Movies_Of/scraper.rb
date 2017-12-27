require 'nokogiri'
require 'open-uri'
require 'pry'
require 'nikkou'

class TopMoviesOf::Scraper

  def initialize
  end

  def get_page(year)
    @year = year
    @doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=#{year}"))
  end

  def get_movie_title(year)
    get_title = get_page(year).css("td .articleLink")
    array = []
    x = 0
    while x <= 29 || x < get_title.length
      array << get_title[x].text.lstrip
      x+=1
    end
    return array
  end

  def get_single_movie_page(name)
    url=get_page(@year).search('a').text_includes("#{name}").first
    url_name = url.attributes["href"].value
    Nokogiri::HTML(open("https://www.rottentomatoes.com#{url_name}"))
  end

  def get_single_movie(name)
    page = get_single_movie_page(name)
    @score = page.css("#all-critics-numbers .superPageFontColor").first.text
    @summary = page.css("#movieSynopsis").text.lstrip
    #check out how to get Directed By, Genre, and Actors columns
  end

  def make_movies(year, input)
    x = 1
    get_movie_title(year).each do |movie|
      new_movie = movie.split(" (")
      TopMoviesOf::Movie.new(ranking = x,name = new_movie[0], score = @score, summary = @summary)
      x+=1
    end
  end
end
