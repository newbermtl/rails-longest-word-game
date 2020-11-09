class GamesController < ApplicationController

  @letters = GamesController.new(9)

  def new(size)
    counter = 0
    the_grid = []
    until counter == size
      the_grid << ('a'..'z').to_a.sample(1)
      counter += 1
    end
    the_grid.flatten
  end

  def score
  end
end
