require 'spec_helper'

describe "join/joined buttons" do
  subject { page }

  describe "join a group" do
    let(:admin) { FactoryGirl.create(:user) }
    before(:each) do 
      sign_in user
      visit groups_path
    end

    it "should increment the joined user count" do
      expect do
        click_button "Join"
      end.to change(user.joined_groups, :count).by(1)
    end

    describe "toggling the button" do
      before { click_button "Join" }
      it { should have_xpath("//input[@valule='Joined']") }
    end
  end

  describe "unjoin a group" do
    let(:admin) { FactoryGirl.create(:user) }
    before(:each) do 
      sign_in user
      visit groups_path
    end

    it "should decrement the joined user count" do
      expect do
        click_button "Joined"
      end.to change(user.joined_groups, :count).by(-1)
    end

    describe "toggling the button" do
      before { click_button "Joined" }
      it { should have_xpath("//input[@valule='Join']") }
    end
  end
end
