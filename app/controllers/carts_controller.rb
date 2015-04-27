class CartsController < ApplicationController

  def show
    if session['cart'].any?
      ids = session['cart'].map {|i| i['item_id']}
      @items = Item.where(:id => ids)

    else
      @items = []
    end
  end

  # Método usados para adicionar/remover items ao carrinho
  # Methods used to add/remove items from cart
  def add_item_to_cart
    session['cart'] ||= []

    @item = Item.find_by(id: params[:item_id])
    if @item
      if !session['cart'].any? {|c| c['item_id'] == params[:item_id].to_i}
        if params[:quantidade].present?
          quantity = params[:quantidade].to_i
        else
          quantity = 1
        end

        if quantity > 0 && @item.qtd_disponivel >= quantity
          session['cart'] << {'item_id' => @item.id, 'quantidade' =>  quantity, 'justificativa' => params[:justificativa]}

          @message = "Item #{ @item.item } do pregão #{@item.bid.numero} foi adicionado ao carrinho."
          @status = :notice
        else
          @message = "Quantidade Inválida."
          @status = :alert
        end
      else
        @message = "Item já adicionado ao carrinho."
        @status = :alert
      end
    else
      @message = "Item não encontrado."
      @status = :alert
    end

    redirect_to items_for_aquisition_path, flash: { "#{@status}" => @message } 
  end

  def remove_item_from_cart
    if params[:item_id].present?
      if @item = Item.find_by(id: params[:item_id])
        session['cart'].reject! {|i| i['item_id'] == @item.id}
        @message = "Item #{ @item.item } do pregão #{@item.bid.numero} foi  removido do carrinho."
        @status = :notice
      end
    else
      @message = "Item não encontrado"
      @status = :alert
    end

    redirect_to cart_path, flash: { "#{@status}" => @message } 
  end

  def finalize
    if session['cart'].any?
      order = Order.new(user: current_user)

      order.transaction do
        session['cart'].each do |c|
          item = Item.find(c['item_id'])

          if item.qtd_disponivel >= c['quantidade']
            r = Request.new(item: item, qtd_solicitada: c['quantidade'], status: Request::AGUARDANDO_ENVIO, justificativa: c['justificativa'])

            item.qtd_disponivel -=  c['quantidade']
            item.save

            order.requests << r
          else
            order.errors.add(:item, "#{item.descricao.truncate(50)} não tem a quantidade solicitada, por favor remova do carrinho e adicione novamente com a quantidade disponível.")
            raise ActiveRecord::Rollback
          end
        end

       order.save

      end

      if order.persisted?
        session['cart'] = []
        redirect_to requests_path, notice: 'Pedido efetuado!' and return
      else
        redirect_to requests_path, alert: "Ocorreu um erro ao efetuar o pedido: #{order.errors.full_messages.to_sentence}" and return
      end

    else
      redirect_to cart_path, alert: 'Não há itens no carrinho para que possa ser finalizado o pedido' and return

    end
  end

end
