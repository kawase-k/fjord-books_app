# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  paginates_per 5 # モデルごとにページング機能のデフォルト値を指定
end
