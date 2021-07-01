# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'Foobar'
    assert_equal 'Foobar', user.name_or_email
  end

  test '#follow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow' do
    me = User.create!(email: 'me@exeample.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me.follow(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end
end
