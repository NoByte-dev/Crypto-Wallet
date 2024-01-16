class RemoveUrlImageFromCoins < ActiveRecord::Migration[7.1]
  def change
    remove_column :coins, :url_image, :string
  end
end
