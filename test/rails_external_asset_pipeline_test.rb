require "test_helper"

class RailsExternalAssetPipeline::Test < ActionDispatch::IntegrationTest
  def test_that_the_source_of_an_image_is_set_correctly
    get "/fancy/index"
    image_src = css_select("img")[0]["src"]

    assert_equal "/assets/images/magic-f67894a08006a2af9f5076180676323c.gif", image_src
  end

  def test_that_the_href_of_a_stylesheet_is_set_correctly
    get "/fancy/index"
    style_src = css_select("link")[0]["href"]

    assert_equal "/assets/stylesheets/application-12fcfd0548a6a948c16661f06d20046f.css", style_src
  end
end
