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

        if quantity > 0
          session['cart'] << {'item_id' => @item.id, 'quantidade' =>  quantity}

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

    redirect_to items_path, flash: { "#{@status}" => @message } 
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

end
