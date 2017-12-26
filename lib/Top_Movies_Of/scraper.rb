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
    @score = page.css("#mainColumn #scorePanel .tomato-left .meter-value superPageFontColor").text.to_i
    @summary = page.css("#mainColumn .media-body #movieSynopsis").text
    #check out how to get Directed By, Genre, and Actors columns
  end

  def make_movies(input,input_name = nil)
    get_page_index(input).each do |movie|
      binding.pry
      TopMoviesOf::Movie.new(name = movie) #Make a movie class to create new instances per movie
    end
  end
end
