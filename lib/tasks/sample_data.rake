namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_group5
    make_groups
 end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.jp",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.jp"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_groups
  50.times do |n|
    group_name = "Example-#{n+1}club."
    group_detail  = Faker::Lorem.sentence(5)
    Group.create!(group_name:     group_name,
                 group_detail:   group_detail)
  end
end

def make_group5
  group_name = "Baseball club."
  group_detail  = "This is baseball cliub."
  Group.create!(group_name:     group_name,
               group_detail:   group_detail)
  group_name = "Fishing club."
  group_detail  = "This is fishing cliub."
  Group.create!(group_name:     group_name,
               group_detail:   group_detail)
  group_name = "Cooking club."
  group_detail  = "This is cooking cliub."
  Group.create!(group_name:     group_name,
               group_detail:   group_detail)
  group_name = "Shoping club."
  group_detail  = "This is shopping cliub."
  Group.create!(group_name:     group_name,
               group_detail:   group_detail)
  group_name = "Game club."
  group_detail  = "This is game cliub."
  Group.create!(group_name:     group_name,
               group_detail:   group_detail)
end

