require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全てのデータが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it "priceが300未満では登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが10000000以上では登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが半角数字以外では登録できないこと" do
      @item.price = "300円"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "category_idが1では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "condition_idが空では登録できないこと" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "condition_idが1では登録できないこと" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "delivery_charge_idが空では登録できないこと" do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it "delivery_charge_idが1では登録できないこと" do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end

    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "prefecture_idが1では登録できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "days_to_ship_idが空では登録できないこと" do
      @item.days_to_ship_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end

    it "days_to_ship_idが1では登録できないこと" do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
    end
  end
end
