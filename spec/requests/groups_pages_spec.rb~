require 'spec_helper'

describe "Groups pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit groups_path
    end

    it { should have_title('Group list') }
    it { should have_content('Group list') }

    describe "pagination" do

      before(:all) { 50.times { FactoryGirl.create(:group) } }
      after(:all)  { Group.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each group" do
        Group.paginate(page: 1).each do |group|
          expect(page).to have_selector('li', text: group.group_name)
        end
      end
    end

    describe "create link" do
      it { should have_link('Create group...') }
    end
  end


  describe "group creation" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit groups_path
      visit new_group_path
    end

    let(:submit) { "Create group" }
    
    describe "with invalid information" do
      it "should not create a group" do
        expect { click_button submit }.not_to change(Group, :count)
      end

     describe "error messages" do
        before { click_button submit }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Group name",   with:"Example group"
	fill_in "Group detail", with:"This is example group."
      end
      
      it "should create a group" do
        expect { click_button submit }.to change(Group, :count).by(1)
      end

      describe "after saving the group" do
        before { click_button submit }
	let(:group) { Group.find_by(group_name: 'Example group') }

	it { should have_title('Group list') }
	it { should have_selector('div.alert.alert-success', text: 'New group created!')}
      end
    end
  end
end

