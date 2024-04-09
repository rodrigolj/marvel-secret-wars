module StoriesHelper
  def story_title
    story_results["title"]
  end

  def story_description
    story_results["description"]
  end

  def characters_results
    @characters["data"]["results"]
  end

  def character_thumbnail(resource)
    thumb = resource["thumbnail"]["path"]
    ext = resource["thumbnail"]["extension"]
    "#{thumb}.#{ext}"
  end

  def character_name(resource)
    resource["name"]
  end

  def attribution_text(resource)
    resource["attributionText"]
  end

  private
  def story_results
    @story["data"]["results"].first
  end
end
