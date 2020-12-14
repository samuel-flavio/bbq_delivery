module CurrentCarrinho
    private
    def set_carrinho
        @carrinho = Carrinho.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        @carrinho = Carrinho.create
        session[:cart_id] = @carrinho.id
    end
end
