class TopMoviesOf::Scraper 

  def get_page(input)
    Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/?year=#{input}"))
  end

  def get_page_index(input)
    self.get_page(input).css(".table .unstyled article Link").text
  end 
end 
