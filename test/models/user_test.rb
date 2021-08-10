require "test_helper"

class UserTest < ActiveSupport::TestCase
# 完全符合条件的email、password、role
  test 'valid: user with all valid things' do
    user = User.new(email: 'user0@demo.com', password_digest:'123456', role:1)
    assert user.valid?
  end

# 不符合格式的email
  test 'invalid: user with invalid email' do
    user = User.new(email: 'test', password_digest:'123456', role:1)
    assert_not user.valid?
  end

# 重复的email
  test 'invalid: user with taken email' do
    user = User.new(email: users(:one).email, password_digest:'123456', role:1)
    assert_not user.valid?
  end

# 使用不合法的password_digest
  test 'invalid: user with invalid password_digest' do
    user = User.new(email: 'test1@test.cn', password_digest:'', role:1)
    assert_not user.valid?
  end

# 使用不合法的role
  test 'invalid: user with invalid role' do
    user = User.new(email: 'test2@test.cn', password_digest:'123456', role:5)
    assert_not user.valid?
  end

# 合法password 测试
  test 'invalid: user with valid password' do 
    user = User.new(email: 'test3@test.cn',password:'123456',role:1)
    assert user.valid?
  end

# 不合法password 测试
  test 'invalid: user with invalid password' do 
    user = User.new(email: 'test4@test.cn',password:'',role:1)
    assert_not user.valid?
  end
end

