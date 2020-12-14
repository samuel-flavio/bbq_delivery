class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.text :endereco
      t.text :complemento
      t.string :bairro
      t.string :cep
      t.string :bairro
      t.text :contato

      t.timestamps
    end
  end
end
