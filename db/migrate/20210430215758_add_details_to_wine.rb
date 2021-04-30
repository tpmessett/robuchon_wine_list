class AddDetailsToWine < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :vineyard, :string
    add_column :wines, :description, :text
    add_column :wines, :organic, :boolean
    add_column :wines, :biodynamic, :boolean
    add_column :wines, :serving_temperature, :string
    add_column :wines, :price, :float
    add_column :wines, :guard, :string
    add_column :wines, :weight, :string
    add_column :wines, :region, :string
    add_column :wines, :product_information, :string, array: true, default: []
    add_column :wines, :food_pairings, :string, array: true, default: []
    add_column :wines, :tasting_notes, :string, array: true, default: []
    add_column :wines, :allergens, :string, array: true, default: []
  end
end
