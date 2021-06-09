# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user! # ログインしていない時に登録した内容を確認できないようにする
end
