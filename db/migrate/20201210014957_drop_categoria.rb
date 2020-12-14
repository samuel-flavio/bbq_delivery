class DropCategoria < ActiveRecord::Migration[5.2]
  def change
    drop_table :categoria
  end
end
