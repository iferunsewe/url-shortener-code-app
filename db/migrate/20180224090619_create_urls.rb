class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :original
      t.url :shortened

      t.timestamps
    end
  end
end
