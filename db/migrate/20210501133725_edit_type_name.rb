class EditTypeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :wines, :type, :wine_type
  end
end
