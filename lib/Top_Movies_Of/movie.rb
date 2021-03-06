class TopMoviesOf::Movie

  @@all = []

  attr_accessor :name, :score, :ranking, :summary 

  def initialize(ranking = nil, name = nil, score = nil, summary = nil)
    @ranking = ranking
    @name = name
    @score = score
    @summary = summary
    @@all <<self
  end

  def self.all
    @@all
  end

  def self.find_movie(input)
    self.all.each do |movie|
      if movie.ranking == input
        @name = movie.name
        return movie
      end
    end
  end




end
