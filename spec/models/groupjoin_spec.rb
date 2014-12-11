require 'spec_helper'

describe Groupjoin do

  before do 
    @test = Group.new(group_name: "Example",
                              group_detail: "This is an example.") 

    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }
  subject { @test }

  let(:user) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group) }

  let(:groupjoins) { group.groupjoins.build(user_id: user.id) }

  subject { groupjoins }

  it { should be_valid }

  describe "when user id is not present" do
    before { groupjoins.user_id = nil }
    it { should_not be_valid }
  end

  describe "when group id is not present" do
    before { groupjoins.group_id = nil }
    it { should_not be_valid }
  end

  describe "join" do
    before do
      @test.save!
      @user.save!
      @test.join!(@user) 
    end
    it { should be_joined(@user) }
  end

  describe "unjoin" do
    before do
      @test.unjoin(@user) 
    end

    it { should_not be_joined(@user) }
  end
end
