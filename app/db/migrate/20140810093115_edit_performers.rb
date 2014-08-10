class EditPerformers < ActiveRecord::Migration
  def change
    add_column :performers, :password_digest, :string
  end
end
