class AddDescriptionToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :description, :text
  end
end
