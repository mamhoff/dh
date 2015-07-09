module ApplicationHelper

  ### Works page

  # Get all years in an array, in descending order
  def get_years
    Alchemy::EssenceDate.order(date: :desc).pluck(:date)
      .compact.map(&:year).uniq
  end

  # All works with data within a year
  def get_works_for (year)
    Alchemy::Page
      .joins(:essence_dates)
      .includes(:essence_dates, elements: [:contents])
      .reorder('alchemy_essence_dates.date DESC')
      .where('alchemy_essence_dates.date >= ? and alchemy_essence_dates.date <= ?',
        "#{year}-01-01", "#{year}-12-31")
  end

  # Render thumbnail URL for work page
  # Look for an image on the work page that we can use
  def render_work_thumbnail (page)
    image_slider = page.find_elements(only: ['image_slider',
      'image_gallery']).first

    if image_slider
      render_essence_view(image_slider.contents.gallery_pictures.first,
                          { image_size: '250x250', crop: true },
                          { class: 'dh-works-page-thumbnail' })
    else
      image_tag('question_mark.png', alt: 'No preview found')
    end
  end


  ### Work pages

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
