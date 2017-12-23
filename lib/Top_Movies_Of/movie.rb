class TopMoviesOf::Movie


  attr_accessor :name, :score, :summary, :director, :actors, :genre #do i want all of these accessors? check the site for what's available to scrape 

  def initialize(name)
    @name = name 
  end 

  def get_attributes
    
  end 


end 