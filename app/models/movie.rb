class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def average_age
    actors.average(:age)

  end

  def age_after_beauty
    # actors.order("age ASC")
    #this is what I came up with that worked in pry
    #but I wasn't able to test it
  end
end
