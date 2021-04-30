class AddQrCodeToWine < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :qr_code, :string
  end
end
