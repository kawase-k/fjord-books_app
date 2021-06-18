# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @title = t('views.common.followings')
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'users'
  end

  def followers
    @title = t('views.common.followers')
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'users'
  end
end
