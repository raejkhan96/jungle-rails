require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page from home page", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details" do
    # ACT
    visit root_path
    find('.products article:first-child a.btn-default').click
    
    # DEBUG 
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show'

     # DEBUG - this screenshot shows you visiting the product details page
    save_screenshot
  end

end
