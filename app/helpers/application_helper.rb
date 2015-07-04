module ApplicationHelper

  # Extract iframe src from Vimeo embed code.
  def extract_vimeo_source (vimeo_embed_code)
    vimeo_embed_code.match(/src=\"(.*?)\"/)[1].to_s
  end

  # Extract video id from Vimeo embed code.
  def extract_vimeo_id (vimeo_embed_code)
    extract_vimeo_source(vimeo_embed_code)
      .match(/video\/(\d+)$/)[1].to_s
  end

end
