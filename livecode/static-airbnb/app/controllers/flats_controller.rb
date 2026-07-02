require "open-uri"

class FlatsController < ApplicationController
  def index
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json" # fetch flats from json file
    @flats = JSON.parse(URI.parse(url).read) # parse json file into ruby object
  end

  def show
    id = params[:id] # get id from params
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    flats_json = URI.open(url).read # fetch flats from json file
    @flats = JSON.parse(flats_json) # parse json file into ruby object
    @flat = @flats.find do |flat_hash|
      flat_hash['id'] == id.to_i # find flat by id
    end
  end
end
