# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user   = User.create!(email: 'user@exeample.com', password: 'password')
    @report = Report.create!(user: @user, title: '初日報', content: 'よろしくお願いいたします')
  end

  test '#editable?' do
    assert @user.valid?
    assert @report.valid?
    assert @report.editable?(@user)
  end

  test '#created_on' do
    assert @user.valid?
    assert @report.valid?
    assert @report.created_on
    assert_not_equal @report, @report.created_on
  end
end
