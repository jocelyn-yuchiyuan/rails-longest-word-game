require "open-uri"
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10).join
  end

  def score
      if params[:word].split('').all? do |letter|
        params[:letters].count(letter) >= params[:word].count(letter)
        check_english?(params[:word])
        end
         @answer = "Congratulation #{params[:word]} is a English word"


      else
        @answer = "#{params[:word]} does not exist"
      end

  end

  private

  def check_english?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    JSON.parse(open(url).read)["found"]

  end


end


# params[:letters].count(letter) >= params[:word].count(letter)
