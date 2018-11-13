class CreateBattlestations < ActiveRecord::Migration[5.2]
  def change
    create_table :battlestations do |t|
      t.string :name
      t.string :cpu
      t.string :cpu_cooler
      t.string :motherboard
      t.string :storage
      t.string :video_card
      t.string :case
      t.string :power_supply
      t.string :operating_system
      t.string :monitor

      t.timestamps
    end
  end
end
