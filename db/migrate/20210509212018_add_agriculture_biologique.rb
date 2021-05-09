class AddAgricultureBiologique < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :agriculture_bioloique, :boolean
  end
end
