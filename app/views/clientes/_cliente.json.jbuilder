json.extract! cliente, :id, :nome, :email, :endereco, :complemento, :bairro, :cep, :bairro, :contato, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
