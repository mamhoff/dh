module ApplicationHelper

  ### Works page

  # Get pages in a hash sorted by year
  def years_with_pages
    sorted_pages = @page.children
      .joins(:essence_dates)
      .includes(:essence_dates)
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
