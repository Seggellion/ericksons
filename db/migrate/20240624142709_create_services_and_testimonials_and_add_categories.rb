class CreateServicesAndTestimonialsAndAddCategories < ActiveRecord::Migration[7.1]
  def change

    
    # Create categories table
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    
    create_table :services do |t|
      t.string :title, null: false
      t.text :content
      t.string :featured_image
      t.references :category, foreign_key: true

      t.timestamps
    end

    # Create testimonials table
    create_table :testimonials do |t|
      t.string :title, null: false
      t.text :content
      t.references :category, foreign_key: true

      t.timestamps
    end

    # Add category references to existing tables
    add_reference :pages, :category, foreign_key: true
    add_reference :articles, :category, foreign_key: true
    add_reference :posts, :category, foreign_key: true



  end
end
