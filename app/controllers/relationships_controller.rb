# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    if user.nil?
      redirect_to user_path
    else
      current_user.unfollow(user)
      redirect_to user
    end
  end
end
