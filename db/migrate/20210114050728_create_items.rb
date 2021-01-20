class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,      null: false
      t.integer    :get_price,  null: false 
      t.text       :detail,     null: false
      t.references :user,       foreign_key: true

      t.timestamps
    end
  end
end
