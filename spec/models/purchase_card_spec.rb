require 'rails_helper'

RSpec.describe PurchaseCard, type: :model do
  before do
    @purchase_card = FactoryBot.build(:purchase_card)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it '必要な情報が入力されていれば購入できること' do
        expect(@purchase_card).to be_valid
      end

      it 'building_nameが空でも登録できること' do
        @purchase_card.building_name = nil
        expect(@purchase_card).to be_valid
      end
    end
  end

  context '購入がうまくいかないとき' do
    it 'tokenが空では登録できないこと' do
      @purchase_card.token = nil
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空では登録できなこと' do
      @purchase_card.post_code = nil
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    it 'post_codeにハイフンがないと登録できないこと' do
      @purchase_card.post_code = 1_234_567
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idが１では登録できないこと' do
      @purchase_card.prefecture_id = 1
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'cityが空では登録できないこと' do
      @purchase_card.city = nil
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include("City can't be blank")
    end

    it 'blockが空だと登録できないこと' do
      @purchase_card.block = nil
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include("Block can't be blank")
    end

    it 'phone_numberが空だと登録できないこと' do
      @purchase_card.phone_number = nil
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが11桁以上だと登録できないこと' do
      @purchase_card.phone_number = 990_123_456_789
      @purchase_card.valid?
      expect(@purchase_card.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
