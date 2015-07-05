module ApplicationHelper

  ### Works page

  # Get pages in a hash sorted by year
  def years_with_pages
    sorted_pages = @page.children
      .joins(:essence_dates)
      .includes(:essence_dates, elements: [:contents])
      .reorder('alchemy_essence_dates.date DESC')

    pages_hash = HashWithIndifferentAccess.new
    sorted_pages.each do |page|
      date = page.essence_dates[0].date
      year = date.year if date
      key = year ? year.to_s : 'Unknown year'
      unless pages_hash.has_key? key
        pages_hash[key] = Array.new
      end
    end

    sorted_pages.each do |page|
      date = page.essence_dates[0].date
      year = date.year if date
      key = year ? year.to_s : 'Unknown year'
      pages_hash[key].push(page)
    end

    pages_hash
  end

  # Render page thumbnail URL
  # Look for an image on the page that we can use
  def render_page_thumbnail (page, options = {})
    options = {
      class: '',
      image_size: '250x250',
      crop: true
    }.merge(options)

    image_slider = page.find_elements(only: 'image_slider').first

    if image_slider
      render_essence_view(image_slider.contents.gallery_pictures.first,
                          { image_size: options[:image_size],
                            crop: options[:crop] },
                          { class: options[:class] })
    else
      content_tag(:p, 'No image found')
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
