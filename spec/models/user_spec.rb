require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    # 2a
    it 'displays an error if password and password confirmation do not match' do
      test_user = User.create ({
        first_name: 'Barry',
        last_name: 'Benson',
        email: 'barrybbenson@gmail.com',
        password: 'Honey',
        password_confirmation: 'Honey1'      
      })      
      expect(test_user.errors.full_messages.first).to eq "Password confirmation doesn't match Password"
    end

    # 2b
    it 'displays an error if the email is not unique' do
      test_user_a = User.create ({
        first_name: 'Barry',
        last_name: 'Benson',
        email: 'barrybbenson@gmail.com',
        password: 'Honey',
        password_confirmation: 'Honey'      
      })      
      test_user_b = User.create ({
        first_name: 'Barry',
        last_name: 'Benson',
        email: 'barryBBENSON@gmail.com', 
        password: 'Honey',
        password_confirmation: 'Honey'      
      })      
      expect(test_user_b.errors.full_messages).to eq ["Email has already been taken"]      
    end

    # 2c_i
    it 'displays error if first name is missing' do
      test_user = User.create ({
        last_name: 'Benson',
        email: 'barrybbenson@gmail.com',
        password: 'Honey',
        password_confirmation: 'Honey'      
      })      
      expect(test_user.errors.full_messages).to eq ["First name can't be blank"]
    end

    # 2c_ii
    it 'displays error if last name is missing' do
      test_user = User.create ({
        first_name: 'Barry',
        email: 'barrybbenson@gmail.com',
        password: 'Honey',
        password_confirmation: 'Honey'       
      })      
      expect(test_user.errors.full_messages).to eq ["Last name can't be blank"]
    end

    # 2c_iii
    it 'displays error if email is missing' do
      test_user = User.create ({
        first_name: 'Barry',
        last_name: 'Benson',
        password: 'Honey',
        password_confirmation: 'Honey'     
      })      
      expect(test_user.errors.full_messages).to eq ["Email can't be blank"]
    end

    # 3
    it 'displays an error if password length is too short' do
      test_user = User.create ({
        first_name: 'Barry',
        last_name: 'Benson',
        email: 'barrybbenson@gmail.com',
        password: 'H',
        password_confirmation: 'H'         
      })      
      expect(test_user.errors.full_messages).to eq ["Password is too short (minimum is 2 characters)"]      
    end

  end

  # 4
  describe '.authenticate_with_credentials' do
    
    # examples for this class method here
    # 4a
    it 'should allow the user to login even if they use whitespaces in their email' do
      test_user = User.create ({
        first_name: 'Barry',
        last_name: 'Benson',
        email: 'barrybbenson@gmail.com',
        password: 'Honey',
        password_confirmation: 'Honey'   
      })
      login_user = User.authenticate_with_credentials(' barrybbenson@gmail.com ', 'Honey')
      expect(login_user).to have_attributes(first_name: 'Barry', last_name: 'Benson', email: 'barrybbenson@gmail.com')
    end

     # 4b
     it 'should allow the user to login even if they use the wrong casing for their email' do
      test_user = User.create ({
        first_name: 'Barry',
        last_name: 'Benson',
        email: 'barrybbenson@gmail.com',
        password: 'Honey',
        password_confirmation: 'Honey'   
      })
      login_user = User.authenticate_with_credentials(' barryBBENSON@gmail.com ', 'Honey')
      expect(login_user).to have_attributes(first_name: 'Barry', last_name: 'Benson', email: 'barrybbenson@gmail.com')
    end

  end

end
  