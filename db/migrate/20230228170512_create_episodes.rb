class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.references :season, null: false, foreign_key: true
      t.string :title
      t.text :plot
      t.integer :number

      t.timestamps
    end
  end
end
