class TopMoviesOf::Movie

  @@all = []

  attr_accessor :name, :score, :summary, :director, :actors, :genre #do i want all of these accessors? check the site for what's available to scrape 

  def initialize(ranking = nil, name = nil, score = nil, summary = nil)
    @ranking = ranking
    @name = name 
    @score = score
    @summary = summary 
    @@all <<self 
  end 


  def find_movie(input) 
  end 
  

  

end 