class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title
      t.date :star_daydate
      t.date :fin_day
      t.string :all_day
      t.string :memo

      t.timestamps
    end
  end
end
