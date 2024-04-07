class StoriesController < ApplicationController
  def show
    @client = MarvelClient.new
    @story = @client.get_story(params[:id])
  end
end
