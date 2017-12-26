require 'nokogiri'
require 'open-uri'
require 'pry'

class TopMoviesOf::Scraper

  def initialize
  end

  def get_page(input)
    Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=#{input}"))
  end

  def get_single_movie_page(movie_name)
    split_name = movie_name.downcase.split
    url_name = split_name.join("_")

    Nokogiri::HTML(open("https://www.rottentomatoes.com/m/#{url_name}"))
  end

  def get_page_index(input)
    get_title = get_page(input).css("td .articleLink")
    array = []
    x = 0
    while x < get_title.length
      array << get_title[x].text.lstrip
      x+=1
    end
    return array
  end

  def get_single_movie(movie_name)
    page = get_single_movie_page(movie_name)
    @score = page.css("#all-critics-numbers .superPageFontColor").first.text
    @summary = page.css("#movieSynopsis").text.lstrip
    #check out how to get Directed By, Genre, and Actors columns
  end

  def make_movies(input,input_name = nil)
    x = 1
    get_page_index(input).each do |movie|
      new_movie = movie.split(" (")
      get_single_movie(new_movie[0])
      TopMoviesOf::Movie.new(ranking = x,name = new_movie[0], score = @score, summary = @summary)
      x+=1
    end
  end
end
