require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { activation_digest: @post.activation_digest, amount_needed: @post.amount_needed, amount_raised: @post.amount_raised, anon_email: @post.anon_email, category: @post.category, description: @post.description, description_met: @post.description_met, email: @post.email, email_key: @post.email_key, facilitated_by_church: @post.facilitated_by_church, flagged: @post.flagged, name: @post.name, phone: @post.phone, picture: @post.picture, show_phone: @post.show_phone, status: @post.status, street_address: @post.street_address, title: @post.title, zip: @post.zip }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { activation_digest: @post.activation_digest, amount_needed: @post.amount_needed, amount_raised: @post.amount_raised, anon_email: @post.anon_email, category: @post.category, description: @post.description, description_met: @post.description_met, email: @post.email, email_key: @post.email_key, facilitated_by_church: @post.facilitated_by_church, flagged: @post.flagged, name: @post.name, phone: @post.phone, picture: @post.picture, show_phone: @post.show_phone, status: @post.status, street_address: @post.street_address, title: @post.title, zip: @post.zip }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
