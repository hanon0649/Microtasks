class CreateMicrotasks < ActiveRecord::Migration[5.0]
  def change
    create_table :microtasks do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
