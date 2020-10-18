require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")

  end

  test "category should be valid" do
    
    @category.valid?

  end

  test "name can't be blank" do
    @category.name = "       "
    assert_not @category.valid?
  end

  test "name must be unique" do
    @category.save

    @new_category = Category.new(name: "sports")
    assert_not @new_category.valid?

  end

  test "name can't be too long" do
    
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name can't be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end


end