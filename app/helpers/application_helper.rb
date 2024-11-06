module ApplicationHelper
  ### Works page

  # Get all years in an array of strings, in descending order
  def get_years
    Alchemy::Ingredient
      .where(role: "year", type: "Alchemy::Ingredients::Select")
      .joins(element: :page)
      .merge(Alchemy::Page.published)
      .order(value: :desc)
      .pluck(:value)
      .uniq
  end

  # All works with data within a year, sorted by their page position
  def get_works_for(year)
    Alchemy::Page.published
      .joins(elements: :ingredients)
      .includes(elements: :ingredients)
      .reorder(:lft)
      .where(alchemy_ingredients: { role: "year", type: "Alchemy::Ingredients::Select" })
      .where('alchemy_ingredients.value = ?', year)
      .distinct
  end

  # Render thumbnail URL for work page
  # Look for an image on the work page that we can use
  def render_work_thumbnail(page)
    image_slider = page.find_elements(only: ['image_slider',
      'image_gallery']).first
    if image_slider && image_slider.nested_elements.present?
      render Alchemy::Ingredients::PictureView.new(
        image_slider.nested_elements.first.ingredients.first,
          picture_options: { size: '170x170', crop: true },
          html_options: { class: 'dh-works-page-thumbnail' }
      )
    else
      image_tag('question_mark.png', alt: 'No preview found')
    end
  end

  ### Work pages

  # Extract iframe src from Vimeo embed code.
  def extract_vimeo_source(vimeo_embed_code)
    vimeo_embed_code.match(/src=\"(.*?)\"/)[1].to_s
  end

  # Extract video id from Vimeo embed code.
  def extract_vimeo_id(vimeo_embed_code)
    extract_vimeo_source(vimeo_embed_code)
      .match(/video\/(\d+)$/)[1].to_s
  end
end
