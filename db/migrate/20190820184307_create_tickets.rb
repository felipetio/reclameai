class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :order, null: false, foreign_key: true
      t.string :description
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.boolean :suspicious

      t.timestamps
    end
  end
end
