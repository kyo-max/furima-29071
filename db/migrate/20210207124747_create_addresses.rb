class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string     :postal_code,    null:false
      t.integer    :prefectures_id, null:false
      t.string     :municipality,   null:false
      t.string     :block_number,   null:false
      t.string     :apartment_name
      t.string     :phone_number,   null:false
      t.references :order,          null:false, foreign_key: true
    end
  end
end
