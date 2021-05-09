class AddVintage < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :vintage, :string
  end
end
