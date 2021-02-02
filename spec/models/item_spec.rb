require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が保存できる場合' do
      it '画像、商品名、商品説明、カテゴリー、商品の状態、配送料の負担、
      発送元の地域、発送までの日数、販売価格がある場合保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない場合' do
      it '商品画像がない場合保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image can\'t be blank')
      end
      it '商品名が入力されていない場合保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Name can\'t be blank')
      end
      it '商品説明が入力されていない場合保存できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Description can\'t be blank')
      end
      it 'カテゴリーが選択されていない場合保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が選択されていない場合保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料の負担が選択されていない場合保存できない' do
        @item.shipping_fee_bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee bearer must be other than 1')
      end
      it '発送元の地域が選択されていない場合保存できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '発送までの日数が選択されていない場合保存できない' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship day must be other than 1')
      end
      it '販売価格が入力されていない場合保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price can\'t be blank')
      end
      it '価格が300未満の場合保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が10000000以上の場合保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格は全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は数字以外では登録できない' do
        @item.price = '三百'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
