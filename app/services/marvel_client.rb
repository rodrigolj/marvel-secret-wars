require 'net/http'
class MarvelClient
  def initialize
    @public_key = Rails.application.credentials.marvel.public_key
    @private_key = Rails.application.credentials.marvel.private_key
    @base_url = 'https://gateway.marvel.com:443/v1/public'
  end

  def get_story(story_id)
    new_ts_and_hash
    uri = URI("#{@base_url}/stories/#{story_id}?apikey=#{@public_key}&ts=#{@ts}&hash=#{@hash}")
    response = Net::HTTP.get(uri, headers = {'Content-Type' => 'application/json'}, use_ssl = true)
    JSON.parse(response)
  end

  private
  def new_ts_and_hash
    @ts = DateTime.now.to_s
    md5 = Digest::MD5.new
    md5.update(@ts + @private_key + @public_key)
    @hash = md5.hexdigest
  end

end