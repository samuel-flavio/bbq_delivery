class Produto < ApplicationRecord
    has_many :line_items
    before_destroy :ensure_not_referenced_by_any_line_item
    has_one_attached :image
    belongs_to :departamento, optional: true

    validates :preco, :departamento, :quantidade, presence: true
    validates :nome, length: { minimum: 4 }
    validates :descricao, length: { in: 5..200 }
end
