
require 'rails_helper'


RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    # validation tests/example here

    it 'saves a product with all four fields into the database' do
      test_cat = Category.create name: "test"
      test_product = test_cat.products.create({
        name: 'iPhone 14',
        price: 20000,
        quantity: 1,
        category: test_cat
      })
      expect(test_product).to have_attributes(:name => 'iPhone 14', :price => 20000, :quantity => 1, :category => test_cat)
    end

    it 'displays error if name is nil' do
      test_cat = Category.create name: "test"
      test_product = test_cat.products.create({
        price: 20000,
        quantity: 1,
        category: test_cat
      })
      expect(test_product.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'displays error if price is nil' do
      test_cat = Category.create name: "test"
      test_product = test_cat.products.create({
        name: 'iPhone 14',
        quantity: 1,
        category: test_cat
      })
      expect(test_product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end

    it 'displays error if quantity is nil' do
      test_cat = Category.create name: "test"
      test_product = test_cat.products.create({
        name: 'iPhone 14',
        price: 20000,
        category: test_cat
      })
      expect(test_product.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    it 'displays error if category is nil' do
      # test_cat = Category.create 
      test_product = Product.create({
        name: 'iPhone 14',
        price: 20000,
        quantity: 1
      })
      expect(test_product.errors.full_messages).to eq ["Category can't be blank"]
    end
  end

end