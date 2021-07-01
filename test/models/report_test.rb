# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    user = User.create!(email: 'user@exeample.com', password: 'password')
    report = Report.create!(user: user, title: '初日報', content: 'よろしくお願いいたします')

    assert report.editable?(user)
  end

  test '#created_on' do
    user = User.create!(email: 'user@exeample.com', password: 'password')
    report = Report.create!(user: user, title: '初日報', content: 'よろしくお願いいたします')

    assert report.created_on
    assert_not_equal report, report.created_on
  end
end
