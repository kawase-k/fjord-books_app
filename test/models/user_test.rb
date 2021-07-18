# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @me  = User.create!(email: 'me@example.com', password: 'passwoed', name: '')
    @she = User.create!(email: 'she@example.com', password: 'password')
  end

  test '#followings' do
    @me.follow(@she)
    assert_equal @me.followings.first, @she
  end

  test '#followers' do
    @she.follow(@me)
    assert_equal @me.followers.first, @she
  end

  test '#following?' do
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#followed_by?' do
    @she.follow(@me)
    assert @me.followed_by?(@she)
  end

  test '#follow' do
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#unfollow' do
    @me.follow(@she)
    @me.unfollow(@she)
    assert_not @me.following?(@she)
  end

  test '#name_or_email' do
    assert_equal 'me@example.com', @me.name_or_email
    @me.name = 'Foobar'
    assert_equal 'Foobar', @me.name_or_email
  end
end
