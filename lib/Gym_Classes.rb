class Gym_Classes

  attr_accessor :title, :url, :details
    @@all = []
  def initialize(title, url)
    @title = title
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end