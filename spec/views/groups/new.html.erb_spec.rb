require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :group_name => "MyString",
      :group_detail => "MyString"
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", groups_path, "post" do
      assert_select "input#group_group_name[name=?]", "group[group_name]"
      assert_select "input#group_group_detail[name=?]", "group[group_detail]"
    end
  end
end
