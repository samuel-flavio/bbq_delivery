class WelcomeController < ApplicationController
  def index
    @produtos = Produto.order(:nome)
  end
end
