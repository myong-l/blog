namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "Example User",
                 email: "example@railstutorial.jp",
                 password: "foobartest",
                 password_confirmation: "foobartest")
    5.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.jp"
      password  = "password"
      User.create!(username: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all
    10.times do
      note = Faker::Lorem.sentence(5)
      users.each { |user| user.notes.create!(title: note) }
    end
    notes = Note.all
    10.times do
      text = Faker::Lorem.sentence(5)
      image = Faker::Avatar.image("image/noimage.gif")
      notes.each { |note| note.contents.create!(
      	           text: text,
      	           content_img: image
      	           ) }
    end
  end
end