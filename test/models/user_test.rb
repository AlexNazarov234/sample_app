require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: 'Serg', email: 'test@test.ru', password: 'qwerty', password_confirmation: 'qwerty')
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "a" * 245 + 'tes@test.ru' 
  	assert_not @user.valid?
  end

  test "email should have correct name" do
  	@user.email = "testest.ru"
  	assert_not @user.valid?
  end

  test "email should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "password should have minimum length" do
  	@user.password = @user.password_confirmation = "a" * 5
  	assert_not @user.valid?
  end

end
