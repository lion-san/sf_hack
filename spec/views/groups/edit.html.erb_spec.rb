require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :group_name => "MyString",
      :group_detail => "MyString"
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_group_name[name=?]", "group[group_name]"
      assert_select "input#group_group_detail[name=?]", "group[group_detail]"
    end
  end
end
