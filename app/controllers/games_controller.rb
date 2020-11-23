require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ((0...8).map { (65 + rand(26)).chr }.join)
  end
  def score
    @letters = params[:letters]
    @user_input = params[:user_input]
    raw_response = open("https://wagon-dictionary.herokuapp.com/#{@user_input}").read
    response = JSON.parse(raw_response)
    # before iteration, declare variable that stores a default true boolean
    #iterate over user_input (change all to each)
    # for each letter check if the letter is included in letters array (IF)
    # if its the case, index instead of include, remove at that index
    # else turn that boolean to false
    if @user_input.split("").all? { |c| @letters.include?(c.upcase) } == false
      @answer = "Sorry but #{@user_input} cannot be built out of #{@letters}"
    elsif response["found"] == false
      @answer = "Sorry but #{@user_input} does not seem to be a valid English word"
    else response["found"] == true
      @answer = "Congratulatons! #{@user_input} is a valid English word!"
    # else
      # @answer = "Sorry but #{user_input} cannot be built out of #{letters}"
    end
    # if !@user_input.include?(@letters)
    #   @answer = "Sorry but #{user_input} cannot be built out of #{letters}"
    # elsif @user_input ==
    # else ==
  end
end
