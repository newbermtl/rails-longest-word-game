require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    counter = 0
    the_grid = []
    until counter == 9
      the_grid << ('a'..'z').to_a.sample(1)
      counter += 1
    end
    @letters = the_grid.flatten
  end

  def score
    @letters = params[:letters]
    @attempt = params[:attempt]
    url = "https://wagon-dictionary.herokuapp.com/#{@attempt}"
    dictionary_serialized = open(url).read
    dictionary = JSON.parse(dictionary_serialized)
    if dictionary['found'] == true && @attempt.split('').all? { |letter| @attempt.count(letter) <= @letters.count(letter) }

      @result = {
        attempt: @attempt,
        message: 'Good game good game',
        score: 'to come soon'
      }
    else
      @result =  {
        attempt: @attempt,
        message: 'Invalid word',
        score: 0
      }
    end
    @result
  end
end
