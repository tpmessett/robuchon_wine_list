class RemoveAb < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :agriculture_bioloique
  end
end
