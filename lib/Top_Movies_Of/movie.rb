class TopMoviesOf::Movie

  @@all = []

  attr_accessor :name, :score, :summary, :director, :actors, :genre #do i want all of these accessors? check the site for what's available to scrape

  def initialize(name = nil, score = nil, summary = nil)
    @name = name
    @score = score
    @summary = summary
    @@all <<self
  end

  def self.all
    @@all
  end

  def find_movie(input)
    self.all.each do |movie|
      if movie.name = input
        return movie
      end
    end
  end  




end
