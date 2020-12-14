class Carrinho < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_produto(produto)
        current_item = line_items.find_by(produto_id: produto.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(produto_id: produto.id)
        end
        current_item
    end

    def total_preco
        line_items.to_a.sum { |item| item.total_preco }
    end
end
