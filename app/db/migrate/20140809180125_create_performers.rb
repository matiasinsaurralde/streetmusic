class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :name
      t.string :email
      t.string :youtube_url
      t.string :soundcloud_url
      t.timestamps
    end
  end
end
