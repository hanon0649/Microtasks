class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :microtask, foreign_key: { to_table: :microtasks }

      t.timestamps
      
      t.index [:user_id, :microtask_id], unique: true
    end
  end
end

# class CreateFavorelationships < ActiveRecord::Migration[5.0]
#   def change
#     create_table :favorelationships do |t|
#       t.references :user, foreign_key: true
#       t.references :microtask, foreign_key: { to_table: :microtasks }

#       t.timestamps
      
#       t.index [:user_id, :microtask_id], unique: true
#     end
#   end
# end
