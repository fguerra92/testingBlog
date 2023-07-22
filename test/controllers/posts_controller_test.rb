require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success

    get posts_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
    assert_equal Post.count, 3   

  end

  test "should get new" do
    get new_post_url
    assert_response :success

    get new_post_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset

  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { description: @post.description, title: @post.title } }
    
        assert_redirected_to post_url(Post.last)
        assert_response :found
        assert_equal 302, response.status
        assert_equal "text/html", response.media_type
        assert_equal "utf-8", response.charset
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success

    get post_url(posts(:one))
    assert_response :success 
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset

  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success

    get edit_post_url(posts(:one))
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
  end

  test "should update post" do
    patch post_url(@post), params: { post: { description: @post.description, title: @post.title } }
    assert_redirected_to post_url(@post)

    posts(:two).reload
    assert_redirected_to post_url(@post)
    assert_response :found
    assert_equal "Updated Post", @post.title
    assert_equal "Updated Post", @post.description
    assert_equal 302, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)

      assert_redirected_to posts_url
      assert_response :found
      assert_equal 302, response.status
      assert_equal "text/html", response.media_type
      assert_equal "utf-8", response.charset     
    end

    assert_redirected_to posts_url
  end
end


