require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do

    context '保存できる場合' do
  
      it 'ユーザー情報が正しく保存できること' do
        expect(@item).to be_valid
      end
  
    end

    context '保存できない場合' do

  it '商品画像を1枚つけることが必須であること' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it '商品名が必須であること' do
    @item.item = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item can't be blank")
  end

  it '商品の説明が必須であること' do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it 'カテゴリーの情報が必須であること' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category is not a number")
  end

  it '商品の状態についての情報が必須であること' do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition is not a number")
  end

  it '配送料の負担についての情報が必須であること' do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping is not a number")
  end

  it '配送料の負担についての情報が必須であること' do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping is not a number")
  end

  it '発送元の地域についての情報が必須であること' do
    @item.area_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Area is not a number")
  end

  it '発送までの日数についての情報が必須であること' do
    @item.day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Day is not a number")
  end

  it '価格についての情報が必須であること' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格の範囲が、¥300~¥9,999,999の間であること' do
    @item.price = '299'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price は300〜9999999までの範囲で入力してください")
   end

   it '販売価格は半角数字のみ保存可能であること' do
    @item.price = '３００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price は300〜9999999までの範囲で入力してください")
   end
  end
 end
end
