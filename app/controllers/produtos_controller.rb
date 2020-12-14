class ProdutosController < ApplicationController
    before_action :setar_produto, only: [:edit, :destroy, :update]
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    

    def index
        if params[:pesquisar]
            @produtos = Produto.where('nome like ?', "%#{params[:pesquisar]}%")
        else
            @produtos = Produto.order(:nome)
        end
    end

    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end

    def edit
        renderizacao :edit
    end

    def update
        if @produto.update produto_params
            flash[:notice] = "Item atualizado com sucesso!"
            redirect_to root_url
        else
            renderizacao :edit
        end
    end

    def create
        @produto = Produto.new produto_params
        if @produto.save
            flash[:notice] = "Item adicionado com sucesso!"
            redirect_to new_produto_path
        else
            renderizacao :new
        end
    end

    def destroy
        @produto.destroy
        redirect_to root_url
    end

    def show
        @nome = params[:nome]
        @produtos = Produto.where("nome like ?", "%#{@nome}%")
    end

    private

    def produto_params
        valores = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id, :image)
    end

    def setar_produto
        @produto = Produto.find(params[:id])
    end

    def renderizacao(acao)
        @departamentos = Departamento.all
        render acao
    end


end
