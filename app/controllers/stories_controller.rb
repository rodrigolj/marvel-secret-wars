class StoriesController < ApplicationController
  include MarvelClient
  def show
    story_request = MarvelClient::Request.new("stories", 12801).run
    @story = story_request["data"]["results"].first
    characters_request = MarvelClient::Request.new("stories", 12801, "characters").run
    @characters = characters_request["data"]["results"]
  end
end
