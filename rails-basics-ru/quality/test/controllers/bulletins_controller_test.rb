require 'test_helper'
class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get all Bulletins' do
    get bulletins_url
    assert_response :success
    assert_select 'a', 'First Bulletin'
  end

  test 'should get first Bulletin' do
    get bulletin_url(id: bulletins(:first).id)
    assert_response :success
    assert_select 'h1', 'First Bulletin'
    assert_select 'p', 'Body for the first bulletin.'
  end
end
