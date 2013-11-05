namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    superadmin = User.create!(name: "Super Admin User",
                              email: "superadmin@liveforum.com",
                              password: "foobar",
                              password_confirmation: "foobar")
    superadmin.admin = 2
    superadmin.save
    admin = User.create!(name: "Admin User",
                         email: "admin@liveforum.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.admin = 1
    admin.save
    9.times do |n|
      name  = Faker::Name.name
      email = "user-#{n+1}@liveforum.com"
      password  = "foobar"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    category = Category.create!(title:"Java")
    category = Category.create!(title:"Ruby")
    category = Category.create!(title:"Python")
    category = Category.create!(title:"C")
    post = Post.create!(name:"Default Post 1",
                        content:"default post 1 content",
                        tag: "default post tag 1",
                        user_id:1,
                        category_id:1)
    post = Post.create!(name:"Default Post 2",
                        content:"default post 2 content",
                        tag: "default post tag 2",
                        user_id:1,
                        category_id:2)
    post = Post.create!(name:"Default Post 3",
                        content:"default post 3 content",
                        tag: "default post tag 3",
                        user_id:2,
                        category_id:3)
    post = Post.create!(name:"Default Post 4",
                        content:"default post 4 content",
                        tag: "default post tag 4",
                        user_id:2,
                        category_id:4)
  end
end