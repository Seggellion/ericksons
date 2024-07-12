class CreateSectionsAndBlocks < ActiveRecord::Migration[7.1]

      def change
        create_table :sections do |t|
          t.string :name, null: false
          t.string :template, null: false
          t.integer :animation_speed
          t.integer :position
    
          t.timestamps
        end
    
        create_table :blocks do |t|
          t.references :section, null: false, foreign_key: true
          t.string :block_type, null: false
          t.text :content
          t.integer :position
    
          t.timestamps
        end
      end
    end
    

