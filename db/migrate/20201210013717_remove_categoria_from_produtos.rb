class RemoveCategoriaFromProdutos < ActiveRecord::Migration[5.2]
  def change
    remove_column :produtos, :categoria, :string
  end
end
