require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new( username: 'l33tg@mer',  email: 'gamer@email.com', mobile:'0412345678', 
                      password: 'password123', password_confirmation: 'password123')
  end

  test 'User should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = '     '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '     '
    assert_not @user.valid?
  end

  test 'mobile should be present' do
    @user.mobile = '    '
    assert_not @user.valid?
  end

  test 'username should meet minimum length' do
    @user.username = 'aaaa'
    assert_not @user.valid?
  end

  test 'username should not exceed max length' do
    @user.username = 'a' * 31
    assert_not @user.valid?
  end

  test 'email should not exceed max length' do
    @user.email = 'a' * 257
    assert_not @user.valid?
  end

  test 'email validation should accept valid emails' do
    valid_addresses = %w[example@email.com EXAMPLE@email.com.au example.person@EMAIL.JP example-person_here+test@email.com]
    valid_addresses.each do | valid_address |
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid emails' do
    invalid_addresses = %w[example.com example@email,com example@email. example@email+test_com.au]
    invalid_addresses.each do | invalid_address |
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'mobile validation should accept valid phone numbers' do
    valid_mobiles = %w[0412345678 61412345678 672412345678]
    valid_mobiles.each do | valid_mobile |
      @user.mobile = valid_mobile
      assert @user.valid?, "#{valid_mobile.inspect} should be valid"
    end
  end

  test 'mobile validatiion should reject invalid phone numbers' do
    invalid_mobiles = %w[04a123b456 123 04_1234_5678 041234567890123 hello !@&#*$]
    invalid_mobiles.each do | invalid_mobile |
      @user.mobile = invalid_mobile
      assert_not @user.valid?, "#{invalid_mobile.inspect} should be invalid"
    end
  end
  
end
