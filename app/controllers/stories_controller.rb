class StoriesController < ApplicationController
  include MarvelClient
  def show
    @story = MarvelClient::Request.new("stories", 12801).run
    @characters = MarvelClient::Request.new("stories", 12801, "characters").run
  end
end
