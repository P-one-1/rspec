require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  
  # called before every single test
  setup do
    @article = articles(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get articles_url
    assert_response :success
    puts "Articles index."
  end

  test "should get new" do
    get new_article_url
    assert_response :success
    puts "Articles new."
  end

  test "should create article" do
    assert_difference('Article.count') do
      # Reuse the @article instance variable from setup
      post articles_url, params: { article: { body: @article.body, text: @article.text } }
    end

    assert_redirected_to article_url(Article.last)
    assert_equal 'Article was successfully created.', flash[:notice]
    puts "Articles create."
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
    puts "Articles show."
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
    puts "Articles edit."
  end

  test "should update article" do
    patch article_url(@article), params: { article: { body: @article.body, text: @article.text } }
    assert_redirected_to article_url(@article)
    assert_equal 'Article was successfully updated.', flash[:notice]
    puts "Articles update."
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
    assert_equal 'Article was successfully destroyed.', flash[:notice]
    puts "Articles destroy."
  end
end
