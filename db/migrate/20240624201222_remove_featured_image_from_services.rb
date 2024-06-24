class RemoveFeaturedImageFromServices < ActiveRecord::Migration[7.1]
  def change
    remove_column :services, :featured_image, :string
  end
end
