require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :content => "MyText",
        :likes => 1,
        :dislikes => 2
      ),
      stub_model(Post,
        :content => "MyText",
        :likes => 1,
        :dislikes => 2
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    pending
  end
end
