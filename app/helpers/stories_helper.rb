module StoriesHelper
  def title(resource)
    resource["title"]
  end

  def description(resource)
    resource["description"]
  end

  def character_thumbnail(resource)
    thumb = resource["thumbnail"]["path"]
    ext = resource["thumbnail"]["extension"]
    "#{thumb}.#{ext}"
  end

  def character_name(resource)
    resource["name"]
  end
end
