require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'foo', email: 'foo@bar.com',
                     phone_number: '+351911111111', password: 'foobar',
                     password_confirmation: 'foobar')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '   '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '   '
    assert_not @user.valid?
  end

  test 'name should be at most 50 characters' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should be at most 255 characters' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn]

    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                        foo@bar_baz.com foo@bar+baz.com foo@bar..com]

    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save

    assert_not duplicate_user.valid?
  end

  test 'email addresses should be converted to lower-case' do
    email = 'Foo@ExAMPle.CoM'
    @user.email = email
    @user.save

    assert_equal email.downcase, @user.reload.email
  end

  test 'phone number should have a correct format' do
    @user.phone_number = 'foo'
    assert_not @user.valid?
  end

  test 'password should not be blank' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'authenticated? should return false for a user with nil digest' do
    assert_not @user.authenticated?(:remember, '')
  end

  test 'associated microposts should be destroyed' do
    @user.save
    @user.microposts.create!(content: 'Lorem ipsum')

    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

  test 'should follow and unfollow a user' do
    maria = users(:maria)
    jane  = users(:jane)
    assert_not maria.following?(jane)

    maria.follow(jane)
    assert maria.following?(jane)
    assert jane.followers.include?(maria)

    maria.unfollow(jane)
    assert_not maria.following?(jane)
  end

  test 'feed should have the correct posts' do
    maria = users(:maria)
    jane = users(:jane)
    bot = users(:bot)

    # Posts from followed user
    bot.microposts.each do |post|
      assert maria.feed.include?(post)
    end

    # Posts from self
    maria.microposts.each do |post|
      assert maria.feed.include?(post)
    end

    # Posts from unfollowed user
    jane.microposts.each do |post|
      assert_not maria.feed.include?(post)
    end
  end

end
