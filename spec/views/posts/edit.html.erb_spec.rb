require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :content => "MyText",
      :likes => 1,
      :dislikes => 1
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#post_likes[name=?]", "post[likes]"
      assert_select "input#post_dislikes[name=?]", "post[dislikes]"
    end
  end
end
