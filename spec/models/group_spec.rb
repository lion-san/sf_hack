require 'spec_helper'

describe Group do
  before { @group = Group.new(group_name: "Example",
                              group_detail: "This is an example.") } 
  subject { @group }

  it { should respond_to(:group_name) }
  it { should respond_to(:group_detail) }

  it { should be_valid }

  describe "when group name is not present" do
    before { @group.group_name = " " }
    it { should_not be_valid }
  end

  describe "when group detail is not present" do
    before { @group.group_detail = " " }
    it { should_not be_valid }
  end

  describe "when group name is too long" do
    before { @group.group_name = "s" * 141 }
    it { should_not be_valid }
  end

  describe "when group detail is too long" do
    before { @group.group_detail = "s" * 1001 }
    it { should_not be_valid }
  end
end
