require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # validate :name, presence: true
    it 'validates name presence' do
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @catergory)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # validate :price, presence: true
    it 'validates price presence' do
      @product = Product.new(name: 'Tea Tree', quantity: 10, category: @catergory)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # validate :quantity, presence: true
    it 'validates quantity presence' do
      @product = Product.new(name: 'Tea Tree', price: 100, quantity: nil, category: @catergory)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    # validate :category, presence: true
    it 'validates category presence' do
      @product = Product.new(name: 'Tea Tree', price: 100, quantity: 10, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
