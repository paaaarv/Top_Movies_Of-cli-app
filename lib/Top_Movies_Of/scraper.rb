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

  def get_single_movie_page(year, name)
    url_name=get_page(year).search('a').text_includes("#{name}").first.values[0]
    Nokogiri::HTML(open("https://www.rottentomatoes.com#{url_name}"))
  end

  def get_page_index(year)
    get_title = get_page(year).css("td .articleLink")
    array = []
    x = 0
    while x < get_title.length
      array << get_title[x].text.lstrip
      x+=1
    end
    return array
  end

  def get_single_movie(year,name)
    page = get_single_movie_page(year,name)
    @score = page.css("#all-critics-numbers .superPageFontColor").first.text
    @summary = page.css("#movieSynopsis").text.lstrip
    #check out how to get Directed By, Genre, and Actors columns
  end

  def make_movies(year)
    x = 1
    get_page_index(year).each do |movie|
      new_movie = movie.split(" (")
      get_single_movie(year,new_movie[0])
      TopMoviesOf::Movie.new(ranking = x,name = new_movie[0], score = @score, summary = @summary)
      x+=1
    end
  end
end
