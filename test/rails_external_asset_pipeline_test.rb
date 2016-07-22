require "test_helper"

class RailsExternalAssetPipeline::Test < ActionDispatch::IntegrationTest
  def test_that_the_source_of_an_image_is_set_correctly
    get "/fancy/index"
    image_src = css_select("img")[0]["src"]

    assert_equal "/assets/images/magic-f67894a08006a2af9f5076180676323c.gif", image_src
  end
end
