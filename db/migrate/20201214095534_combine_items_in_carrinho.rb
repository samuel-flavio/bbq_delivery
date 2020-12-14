class CombineItemsInCarrinho < ActiveRecord::Migration[5.2]
    def up
      #␣replace␣multiple␣items␣for␣a␣single␣product␣in␣a␣cart␣with␣a
      #␣single␣item
      Carrinho.all.each do |carrinho|
        #␣count␣the␣number␣of␣each␣product␣in␣the␣cart
        sums = carrinho.line_items.group(:produto_id).sum(:quantity)
  
        sums.each do |produto_id, quantity|
          if quantity > 1
            #␣remove␣individual␣items
            carrinho.line_items.where(produto_id: produto_id).delete_all

            #␣replace␣with␣a␣single␣item
            item = carrinho.line_items.build(produto_id: produto_id)
            item.quantity = quantity
            item.save!
          end
        end
      end
    end
  
    def down
    # split items␣with␣quantity>1␣into␣multiple␣items
      LineItem.where("quantity>1").each do |line_item|
        #␣add␣individual␣items
        line_item.quantity.times do
          LineItem.create(
            carrinho_id: line_item.carrinho_id,
            produto_id: line_item.produto_id,
            quantity: 1
          )
        end

        #␣remove␣original␣item
        line_item.destroy
      end
    end
  
end
