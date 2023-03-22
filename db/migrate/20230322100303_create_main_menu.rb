class CreateMainMenu < ActiveRecord::Migration[5.2]
  def up
    english = Alchemy::Language.first
    main_menu = Alchemy::Node.find_or_create_by(
      menu_type: "main_menu",
      name: "Main Menu",
      language: english
    )
    index = english.pages.find_by(name: "Index")
    main_menu.children.create(
      page: index,
      name: "Start",
      title: "Start",
      language: english,
      menu_type: "main_menu"
    )
    works = english.pages.find_by(name: "Works")
    main_menu.children.create(
      page: works,
      name: "Works",
      title: "Works",
      language: english,
      menu_type: "main_menu"
    )
    about = english.pages.find_by(name: "About")
    main_menu.children.create(
      page: about,
      name: "About",
      title: "About",
      language: english,
      menu_type: "main_menu"
    )
  end

  def down
    Alchemy::Node.destroy_all
  end
end
