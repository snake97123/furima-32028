class PurchasesController < ApplicationController
  def index
    @item = Item.find_by(params[:id])
    @purchase_card = PurchaseCard.new
  end
  
  def create
     @item = Item.find_by(params[:id])
     @purchase_card = PurchaseCard.new(card_params)
     if @purchase_card.valid?
      pay_item
      @purchase_card.save
      redirect_to root_path
     else
      render action: :index
     end
 end

  private

  def card_params
    params.require(:purchase_card).permit(:post_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(user_id:current_user.id, item_id:@item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create( 
       amount: @item.price,
       card: card_params[:token],
       currency: 'jpy'
    )
  end
end


