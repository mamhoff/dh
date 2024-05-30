class CreateMissingAspectRatios < ActiveRecord::Migration[7.0]
  def change
    Alchemy::Element.where(name: "vimeo_queen").each do |element|
      next if element.value_for(:aspect_ratio).present?
      element.ingredients.create!(
        type: "Alchemy::Ingredients::Select",
        value: "16by9",
        role: "aspect_ratio"
      )
    end
  end
end
