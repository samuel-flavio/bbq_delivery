class LineItem < ApplicationRecord
  belongs_to :produto
  belongs_to :carrinho

  def total_preco
    produto.preco * quantity
  end
end
