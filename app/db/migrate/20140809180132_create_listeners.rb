class CreateListeners < ActiveRecord::Migration
  def change
    create_table :listeners do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
