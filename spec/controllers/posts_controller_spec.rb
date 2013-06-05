require 'spec_helper'

describe PostsController do

render_views

  describe "Testing Json" do
    it "Show JSON" do
    	#visit "/posts/1.json"
    	#assert_response :success
    	#assert body == Post.all.to_json
		#post = JSON.parse(response.body)
		#assert post.size == 3
    end
  end

end
