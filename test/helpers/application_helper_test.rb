require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal 'DropDeadRails', full_title
    assert_equal 'Help | DropDeadRails', full_title('Help')
  end
end
