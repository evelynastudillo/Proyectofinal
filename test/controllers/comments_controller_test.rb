require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
#  test "should get index" do
#    get comments_index_url
#    assert_response :success
#  end

  test "should post create" do
    comment = Comment.new(comment: "test de test")
    post comments_create_url, comment
    assert_response :error
  end

end
